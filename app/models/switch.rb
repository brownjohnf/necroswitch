class Switch < ApplicationRecord
  validates :uuid,
    presence: true

  validates :name,
    presence: true

  validates :interval,
    presence: true

  validates :api_key,
    presence: true

  has_many :events,
    foreign_key: :switch_uuid,
    primary_key: :uuid,
    inverse_of: :switch,
    dependent: :destroy

  belongs_to :api_key,
    inverse_of: :switches

  before_validation do
    self.uuid ||= SecureRandom.uuid
    self.last_checked_at ||= Time.now
  end

  after_create do
    send_notifications(:created)
  end

  MESSAGES = {
    no_data: "Necroswitch '%s' has received no events as of %s",
    created: "Necroswitch '%s' created at %s",
    failed: "Necroswitch '%s' failed at %s",
    recovered: "Necroswitch '%s' was failing, but recovered at %s",
  }

  class << self
    def check
      Switch.find_each do |switch|
        unless switch.active
          warn "skipping switch because it's inactive: " + switch.long_name
          next
        end

        switch.check
      end
    end
  end

  def check
    # Return if it's not time to check yet and it's not currently failing
    if last_check_ok && self.last_checked_at > ( Time.now - self.interval )
      return true
    end

    last_event = self.events.order("created_at DESC").first

    if last_event.nil?
      send_notifications(:no_data)

      update_attributes!({
        last_checked_at: Time.now,
        last_check_ok: false,
      })

      return false
    end

    # All is well
    if last_event.created_at > self.last_checked_at && self.last_check_ok
      update_attributes!({
        last_checked_at: Time.now,
      })

      return true
    end

    # Was down, but is back up
    if last_event.created_at > self.last_checked_at
      send_notifications(:recovered)

      update_attributes!({
        last_checked_at: Time.now,
        last_check_ok: true,
      })

      return true
    end

    send_notifications(:failed)

    update_attributes({
      last_checked_at: Time.now,
      last_check_ok: false,
    })

    false
  end

  def long_name
    "%s (%s)" % [ self.name, self.uuid.first(8) ]
  end

  def send_notifications(opt)
    warn "sending message #{opt} for switch #{long_name}"

    message = MESSAGES[opt] % [ long_name, Time.now ]

    send_sms(message)
    send_email(message)
  end

  def send_sms(message)
    return unless self.sms

    # Send an SMS
    NecroTwilio.client.messages.create({
      from: ENV["TWILIO_FROM_NUMBER"],
      to: self.sms,
      body: message,
    })
  end

  def send_email(message)
    SwitchMailer.message_email(self, message).deliver_later
  end
end


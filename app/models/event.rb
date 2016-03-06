class Event < ApplicationRecord
  validates :switch_uuid,
    presence: true

  validates :ip,
    presence: true

  belongs_to :switch,
    foreign_key: :switch_uuid,
    inverse_of: :events
end


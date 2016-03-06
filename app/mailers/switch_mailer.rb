class SwitchMailer < ApplicationMailer
  default from: "necroswitch@example.com"

  def message_email(switch, message)
    return unless switch.email

    @switch = switch
    @message = message

    mail(to: @switch.email, subject: "Switch message")
  end
end


class SwitchSerializer < ActiveModel::Serializer
  attributes :uuid, :name, :email, :active, :interval, :created_at, :sms,
    :last_check_at, :last_check_ok
end


class SwitchSerializer < ActiveModel::Serializer
  attributes :uuid, :name, :email, :active, :interval, :created_at, :sms
end


class EventSerializer < ActiveModel::Serializer
  attributes :id, :switch_uuid, :message, :created_at, :ip
end


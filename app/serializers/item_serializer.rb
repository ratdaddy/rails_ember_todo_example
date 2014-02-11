class ItemSerializer < ActiveModel::Serializer
  attributes :id, :summary, :is_completed
end

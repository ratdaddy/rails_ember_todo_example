class ItemSerializer < ActiveModel::Serializer
  attributes :id, :summary, :is_completed, :due_date, :priority
end

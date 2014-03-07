class AddUserAndOtherFieldsToItem < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.belongs_to :user, index: true
      t.date :due_date
      t.integer :priority
    end
  end
end

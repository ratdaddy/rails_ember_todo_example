class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :summary
      t.boolean :is_completed

      t.timestamps
    end
  end
end

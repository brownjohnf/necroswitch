class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :switch_uuid
      t.string :message

      t.timestamps
    end

    add_index :events, [:switch_uuid]
  end
end


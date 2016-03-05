class CreateSwitches < ActiveRecord::Migration[5.0]
  def change
    create_table :switches do |t|
      t.string :uuid, null: false
      t.string :name
      t.string :email
      t.string :sms
      t.integer :interval, null: false
      t.boolean :active, default: true
      t.datetime :last_checked_at
      t.boolean :last_check_ok, default: true

      t.timestamps
    end

    add_index :switches, [:uuid], unique: true
  end
end


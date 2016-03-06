class AddIpToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :ip, :string
  end
end


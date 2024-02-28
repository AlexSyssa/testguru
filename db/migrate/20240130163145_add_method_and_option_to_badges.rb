class AddMethodAndOptionToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :method, :string
    add_column :badges, :option, :string
  end
end

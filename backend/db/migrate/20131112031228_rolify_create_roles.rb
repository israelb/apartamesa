class RolifyCreateRoles < ActiveRecord::Migration
  def change
=begin
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end
=end

    create_table(:restaurants_roles, :id => false) do |t|
      t.references :restaurant
      t.references :role
    end

    #add_index(:roles, :name)
    #add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:restaurants_roles, [ :restaurant_id, :role_id ])
  end
end

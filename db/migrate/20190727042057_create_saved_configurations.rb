class CreateSavedConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_configurations do |t|
      t.string      :effect, null: false
      t.string      :slug
      t.string      :hashed_password
      t.jsonb       :configuration, null: false, default: '{}'
      t.timestamps
    end

    add_index :saved_configurations, :slug
  end
end

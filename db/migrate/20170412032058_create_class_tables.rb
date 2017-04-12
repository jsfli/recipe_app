class CreateClassTables < ActiveRecord::Migration[5.0]
  def change

    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end

    create_table(:instructions) do |t|
      t.column(:description, :string)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:rating, :integer)

      t.timestamps()
    end

    create_table(:categories) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)

      t.timestamps()
    end

  end
end

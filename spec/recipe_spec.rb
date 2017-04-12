require("spec_helper")

describe(Recipe) do
  it{should have_many(:instructions)}
  it{should have_many(:ingredients)}
  it{should have_and_belong_to_many(:categories)}

  it("capitalize each word in the recipe name") do
    test_recipe = Recipe.create({:name=>"recipe name", :rating=> 5})
    expect(test_recipe.name()).to(eq("Recipe Name"))
  end
end

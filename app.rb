require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")


#index page links and buttons
get("/") do
  @recipes = Recipe.all()
  erb(:index)
end

get("/web_instruction") do
  erb(:web_instruction)
end

delete('/database_reset') do
  @categories=Category.all()
  @ingredients=Ingredient.all()
  @instructions=Instruction.all()
  @recipes=Recipe.all()
  @categories.each() do |category|
    category.destroy()
  end
  @ingredients.each() do |ingredient|
    ingredient.destroy()
  end
  @instructions.each() do |instruction|
    instruction.destroy()
  end
  @recipes.each() do |recipe|
    recipe.destroy()
  end
  redirect('/')
end

post('/recipes') do
  name = params.fetch("name")
  Recipe.create({:name=>name})
  redirect('/')
end

get('/recipes/:id') do
    @recipe = Recipe.find(params.fetch("id"))
    @instructions = Instruction.all()
    @ingredients = Ingredient.all()
  erb(:recipe)
end

post('/recipes/:id/add_ingredients') do
    recipe = Recipe.find(params.fetch("id"))
    name = params.fetch("name")
    new_ingredient = Ingredient.create({:name => name})
    recipe.ingredients.push(new_ingredient)
  redirect back
end

post('/recipes/:id/add_instructions') do
    recipe = Recipe.find(params.fetch("id"))
    description = params.fetch("description")
    new_instruction = Instruction.create({:description => description})
    recipe.instructions.push(new_instruction)
  redirect back
end

post('/recipes/:id/add_categories') do
    recipe = Recipe.find(params.fetch("id"))
    name = params.fetch("name")
    new_category = Category.where(:name => name).first_or_create({:name => name})
    recipe.categories.push(new_category)
  redirect back
end

delete('/recipes/:id/delete_recipe') do
    recipe = Recipe.find(params.fetch("id"))
    recipe.destroy()
  redirect('/')
end

delete('/ingredients/:id/delete') do
    select_ingredient = Ingredient.find(params.fetch("id"))
    select_ingredient.destroy()
  redirect back
end

delete('/instructions/:id/delete') do
    select_instruction = Instruction.find(params.fetch("id"))
    select_instruction.destroy()
  redirect back
end

delete('/categories/:id/delete') do
    select_category = Category.find(params.fetch("id"))
    recipe_id = params.fetch("recipe_id")
    recipe = Recipe.find(recipe_id)
    recipe.categories.destroy(select_category)
  redirect back
end

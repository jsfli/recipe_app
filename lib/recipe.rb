class Recipe < ActiveRecord::Base
  has_many(:instructions)
  has_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:name, :presence => true)

end

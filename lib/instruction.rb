class Instruction < ActiveRecord::Base
  belongs_to(:recipe)
  validates(:description, :presence => true)
end

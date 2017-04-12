class Recipe < ActiveRecord::Base
  has_many(:instructions, dependent: :destroy)
  has_many(:ingredients, dependent: :destroy)
  has_and_belongs_to_many(:categories)
  validates(:name, :presence => true)
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    self.name=(name().split.map(&:capitalize).join(" "))
  end
end

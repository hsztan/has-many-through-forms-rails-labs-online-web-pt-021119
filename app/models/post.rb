class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: :all_blank
  #accepts_nested_attributes_for :comments
  def category_ids=(category_ids)
    category_ids.each do |category_id|
      category = Category.find(category_id)
      self.categories << category
    end
  end
end

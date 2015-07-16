class Dish < ActiveRecord::Base
  validates :title, :description, presence: true
  belongs_to :user

  scope :published, -> { where(published: true) }

end
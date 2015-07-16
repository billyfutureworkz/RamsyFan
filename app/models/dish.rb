class Dish < ActiveRecord::Base
  validates :title, :description, presence: true
  belongs_to :user

  scope :published_and_approved, -> { where(published: true, approved: true) }

end
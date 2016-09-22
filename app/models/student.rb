class Student < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) } # shows newest to oldest students
  validates :user_id, presence: true
  validates :name, presence: true
  validates :parent_name, presence: true
  validates :parent_email, presence: true
end

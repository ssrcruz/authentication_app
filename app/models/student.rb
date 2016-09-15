class Student < ActiveRecord::Base
  belongs_to :user
  has_many :parents, dependent: :destroy
  default_scope -> { order(created_at: :desc) } # shows newest to oldest students
  validates :user_id, presence: true
  validates :name, presence: true
end

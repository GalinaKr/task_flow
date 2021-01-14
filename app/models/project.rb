class Project < ApplicationRecord
  validates :project_name, presence: true, uniqueness: true

  has_many :tasks, dependent: :destroy
  belongs_to :user
end

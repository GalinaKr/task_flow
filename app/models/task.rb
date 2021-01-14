class Task < ApplicationRecord
  validates :todo, presence: true
  has_many_attached :files

  enum done: { in_progress: 0, done: 1 }
  belongs_to :project
end

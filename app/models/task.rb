class Task < ApplicationRecord
  validates :todo, presence: true

  enum done: { in_progress: 0, done: 1 }
end

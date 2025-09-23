class Task < ApplicationRecord
  belongs_to :project

  enum status: { todo: 0, in_progress: 1, done: 2 }

  validates :title, presence: true, length: { minimum: 3, maximum: 150 }
  validates :status, presence: true
  validates :due_date, comparison: { greater_than_or_equal_to: Date.today }, allow_nil: true
end

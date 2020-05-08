class Task < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :content, presence: true

end

class User < ApplicationRecord
  has_many :tasks
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  def task_count
    if tasks.loaded?
      tasks.size
    else
      tasks.count
    end
  end
end

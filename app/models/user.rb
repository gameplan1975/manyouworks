class User < ApplicationRecord
  before_destroy :admin_presence
  before_update :admin_presence
  has_many :tasks, dependent: :destroy
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
  def admin_presence
    if User.where(admin: true).count <= 1 && self.admin == true
      throw(:abort)
    end
  end
end

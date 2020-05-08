class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true

  def Task.search(search, user_or_task)
    if user_or_task == "2"
      Task.where(['name LIKE ?', "%#{search}%"])
    else
      Task.all
    end
  end
end

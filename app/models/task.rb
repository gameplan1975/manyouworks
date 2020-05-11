class Task < ApplicationRecord
  enum priority: { high: 0, middle: 1, low: 2, other:3 }
  validates :name, presence: true
  validates :content, presence: true
  
  def self.search(search)   
    if search  
      where(['name LIKE ?',"%#{search}%"])   
    else  
      all  
    end  
  end  
end

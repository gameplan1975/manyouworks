class Task < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  
  def self.search(search)   
    if search  
      where(['name LIKE ?', "%#{search}%"])   
    else  
      all  
    end  
  end  
end

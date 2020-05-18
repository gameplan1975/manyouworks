class Task < ApplicationRecord
  enum priority: { high: 0, middle: 1, low: 2, other:3 }
  validates :name, presence: true
  validates :content, presence: true
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  belongs_to :user
  
  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .status_is(search_params[:status])
      #.birthday_from(search_params[:birthday_from])
      #.birthday_to(search_params[:birthday_to])
      #.prefecture_id_is(search_params[:prefecture_id])
  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :status_is, -> (status) { where(status: status) if status.present? }
  #scope :birthday_from, -> (from) { where('? <= birthday', from) if from.present? }
  #scope :birthday_to, -> (to) { where('birthday <= ?', to) if to.present? }
  #scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }
end

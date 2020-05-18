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

  end
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :status_is, -> (status) { where(status: status) if status.present? }
end

class Deal < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :price, presence: true
  validates :message, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true

end

class Deal < ApplicationRecord
  belongs_to :item
  belongs_to :user

  scope :fifty, -> { where('price <= 50') } 
  #scope :hundred, -> {where(price: < 100)} 

  def self.by_user(user_id)
    where(user: user_id)
  end

  
end

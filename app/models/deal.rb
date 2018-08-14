class Deal < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def self.by_user(user_id)
    where(user: user_id)
  end
  
end

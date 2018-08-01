class User < ApplicationRecord
  has_many :deals
  has_many :items, :through => :deals

  has_secure_password

end

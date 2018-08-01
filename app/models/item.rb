class Item < ApplicationRecord
  has_many :deals
  has_many :users, :through => :deals

  @@catagories = ['Appliances', 'Electronics', 'Apparel']

  def self.catagories
    @@catagories
  end


end

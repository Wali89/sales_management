class Item < ApplicationRecord
  has_many :deals


  @@catagories = ['Appliances', 'Electronics', 'Apparel']

  def self.catagories
    @@catagories
  end


end

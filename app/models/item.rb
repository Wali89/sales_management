class Item < ApplicationRecord
  has_many :sales
  has_many :stores, :through => :sales
  
end

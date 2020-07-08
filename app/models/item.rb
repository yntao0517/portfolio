class Item < ApplicationRecord
  has_many :hospital_item
  has_many :hospitals, :through => :hospital_item
end

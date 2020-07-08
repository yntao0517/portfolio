class HospitalItem < ApplicationRecord
  belongs_to :hospital
  belongs_to :item
  has_many :user_items
  has_many :users, :through => :user_items
end

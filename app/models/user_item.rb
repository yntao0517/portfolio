class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :hospital_item
end

class Order < ApplicationRecord
  has_many :orders, depends: :destroy 
end

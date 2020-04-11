class Like < ApplicationRecord
  belongs_to :post, counter_cache: :liles_count
  belongs_to :user
end

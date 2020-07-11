class Follower < ApplicationRecord
validates :followed_to_id, uniqueness: true
end

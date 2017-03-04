class Ownership < ApplicationRecord
  belongs_to :event
  belongs_to :owner
end

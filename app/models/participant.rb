class Participant < ApplicationRecord
  belongs_to :event
  validates :name, uniqueness: { scope: :event  }
end

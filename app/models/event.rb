class Event < ApplicationRecord
  has_one :user
  has_many :participants

  accepts_nested_attributes_for :participants,
    reject_if:      :all_blank,
    allow_destroy:  true
end

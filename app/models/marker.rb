class Marker < ApplicationRecord
  belongs_to :user

  scope :by_recently_created, -> { order(:created_at => :desc)}
  # Ex:- scope :active, -> {where(:active => true)}
end

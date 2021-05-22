class Team < ApplicationRecord
  has_many :players, through :fantasies

  validates :name, presence: true
end

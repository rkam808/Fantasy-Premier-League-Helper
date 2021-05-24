class Team < ApplicationRecord
  has_many :fantasies
  has_many :players, through: :fantasies, :dependent => :destroy

  validates :name, presence: true
  # validates :player, uniqueness: true
end

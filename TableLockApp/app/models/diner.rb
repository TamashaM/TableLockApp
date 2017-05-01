class Diner < ApplicationRecord
  phony_normalize :telephone, default_country_code: 'SL'
  belongs_to :user
  has_one :diner_history
  has_many :favourites
  has_many :reservations
  has_many :waitings

  validates :first_name,:last_name,:telephone, presence: true

  validates :telephone, phony_plausible: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "120x120>" }, default_url: "/images/:style/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end

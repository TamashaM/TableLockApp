class Admin < ApplicationRecord
  phony_normalize :telephone, default_country_code: 'SL'
  belongs_to :user
  validates :first_name,:last_name,:telephone, presence: true

  validates :telephone, phony_plausible: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "120x120>" }, default_url: "/assets/avatar2.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

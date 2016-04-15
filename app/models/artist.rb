class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise   :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :invitable
  has_many :credits
  has_many :tracks, :through => :credits



 
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    name_changed? || super
  end



end 

class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, :dependent => :destroy
  has_many :albums, :dependent => :destroy
  has_many :tracks, :through => :albums
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

   def should_generate_new_friendly_id?
    name_changed? || super
  end

end

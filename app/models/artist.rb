class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise   :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :invitable
  has_many :projects 
  has_many :albums
  has_many :albums, :through => :projects

  #TO DO Set up credit system through some acts as credible model to assign to artists 
  # has_many :credits
  # has_many :tracks, :through => :credits



 
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :city],
      [:name, :street, :city],
      [:name, :street_number, :street, :city]
    ]
  end

end 

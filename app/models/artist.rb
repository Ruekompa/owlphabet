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


attr_accessor :invite_code
validate :invite_code_valid, :on => :create

 def invite_code_valid
  unless self.invite_code == "owlphabetsoup"
    self.errors.add(:invite_code, "invalid.  Ask support@owlphabet.com or try again.")
  end
end
 
  extend FriendlyId
 friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :last_name,
      [:last_name, :first_name]
    ]
  end



end 

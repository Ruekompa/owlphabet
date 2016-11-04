class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name 
  attribute :city 
  attribute :country 
  attribute :website 
  attribute :message
  attribute :invitation_type
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Owlphabet Invitation Request",
      :to => "support@owlphabet.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
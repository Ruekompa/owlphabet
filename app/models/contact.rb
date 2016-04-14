class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name 
  attribute :city 
  attribute :country 
  attribute :website 
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Artist Sign Up",
      :to => "russell@signalmtn.io",
      :from => %("#{name}" <#{email}>)
    }
  end
end
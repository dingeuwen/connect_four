class ConnectFourMailer < ActionMailer::Base
  default from: "e-ding@u.northwestern.edu"
  # note that I should create a new e-mail account and change

  def form_email(to, subject, body)
    @body = body
    mail(:to => to, :subject => "The subject is: #{subject}") 
  end
  
end
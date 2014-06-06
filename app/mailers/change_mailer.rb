class ChangeMailer < ActionMailer::Base
  default from: "ryderc@uci.edu"

 def send_change_message(user)
    mail(:to => user, :subject => "Your Partnership Status has changed")
  end
end

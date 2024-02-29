class ApplicationMailer < ActionMailer::Base
  default from: "programacionpruebas92@gmail.com" #correo registrado en sendgrid y del que mandaras a los demas
  layout "mailer"
end

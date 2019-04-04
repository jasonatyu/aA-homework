class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
    # your code here
        @user = user
        @url = 'http://open.appacademy.io'
        mail(to: user.username, subject: 'Welcome to 99 Cats!')
    end
end

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def example
        UserMailer.welcome_email(User.new(username: 'jason@jasonyu.co'))
    end
end

class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contactus.subject
  #
  def contactus(name, email, phone, message, newsletter, subscribe, contact_method, product)
    @name = name
    @email = email
    @phone = phone
    @message = message
    @newsletter = newsletter
    @subscribe = subscribe
    @contact_method = contact_method
    @product = product

    mail(to: "sglover42@gmail.com", subject: "Customer Contact", bcc: 'dljones@scc.spokane.edu')

  end

  def thankyou(name, email)

    @greeting = "Hello, #{@name}"
    @name = name
    @email = email

    mail(to: @email, subject: "Thank you for your email")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article.subject
  #
  def article(article, user)
    @article = article
    @greeting = "Hello, #{user.first_name}"

    mail(to: user.email, subject: @article.title)
  end
end

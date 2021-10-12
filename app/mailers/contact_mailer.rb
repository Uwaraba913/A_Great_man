class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @name = contact.end_user.name
    @contact = contact
    mail(
      from: contact.end_user.email,
      to: 'ddddedede913@gmail.com',
      subject: 'お問い合わせ通知をお届けします。'
      )
  end
end

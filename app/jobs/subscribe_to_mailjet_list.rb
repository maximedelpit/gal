class SubscribeToMailjetList < ApplicationJob
  queue_as :default

  def perform(user_id)
    return if user_id.nil?
    user = User.find(user_id)
    Mailjet::Contactslist_managecontact.create(id: ENV['MAILJET_LIST_ID'], action: "addforce", email: user.email, name: user.full_name,
      properties: {
        first_name: user.first_name,
        last_name: user.last_name,
        company: user.company,
        job_title: user.job_title,
        language: user.language,
        newsletter_sub: user.nl_subscription
    })
  end
end

class SubscribeMailer < ActionMailer::Base
  default from: 'emailfaceit@gmail.com'

  def new_image(users, category, img)
    @img = img
    @category = category
      mail(to: users.pluck(:email), subject: "New image in the category of #{category.name}") if !users.blank?
  end
end

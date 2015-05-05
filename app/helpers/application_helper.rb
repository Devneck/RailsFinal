module ApplicationHelper
  def stars(num_stars)
    #if num_stars == nil
    #  return ((image_tag "star.png") * 1).html_safe
    #else
      return ((image_tag "star.png") * num_stars).html_safe
    #end

  end

  def mail
    @name = params["name"]
    @email = params["email"]
    @phone = params["phone"]
    @msg = params["msg"]
    @newsletter = params["newsletter"] == "Newsletter"
    @prod_notify = params["product_notify"] == "Product Notification"
    contact = params["contact"]
    @pref_email = contact == "Email"
    @pref_phone = contact == "Phone"
    @product = params["product"]

    UserMailer.contactus(@name, @email, @phone, @msg, @newsletter, @prod_notify, contact, @product).deliver

    UserMailer.thankyou(@name, @email).deliver

    #redirect_to home_path
  end
end

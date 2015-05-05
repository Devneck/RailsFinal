class PageController < ApplicationController
  def aboutus
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

    redirect_to contactus_path
  end

  def contactus
    @submitted = params["commit"]
    @form_error = false

    @name = params["name"]
    if @name == ""
      #@error_msg = "Name is required"
      flash.now["name_error"] = "Name is required."
      @form_error = true
    end

    @email = params["email"]
    if @email == ""
      flash.now["email_error"] = "Email is required."
      @form_error = true
    end

    @phone = params["phone"]

    @msg = params["msg"]
    @newsletter = params["newsletter"] == "Newsletter"
    @prod_notify = params["product_notify"] == "Product Notification"

    contact = params["contact"]
    @pref_email = contact == "Email"
    @pref_phone = contact == "Phone"

    @product = params["product"]

    #@product_list = products
    @product_list = Product.all.pluck(:name)

  end

  def products
=begin
    @products_hash = {
        'Snow Skis' => 200,
        'Snow boards' => 150,
        'Snow Boots' => 100,
        'Mittens' => 9,
        'Gloves' => 15,
        'Hats' => 20
    }
=end
  end

  def newsletter
  end

  def blog
  end

  def calendar
    @time = Time.now
    @month = params['month'].to_i
    @year = params['year'].to_i

    if (@month < 1 || @month > 12)
      @month = @time.strftime("%m").to_i
    end

    if @year <= 0
      @year = @time.strftime("%Y").to_i
    end
  end

  def articles
  end

  def login
  end

  def logout
  end
end

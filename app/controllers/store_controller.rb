class StoreController < ApplicationController
  def index
    @page = params['page']
    @products = Product.page(@page)
  end

  def show
    @product = Product.find(params['id'])
    @review = Review.new
  end
end

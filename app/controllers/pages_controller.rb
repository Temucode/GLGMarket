class PagesController < ApplicationController
  def home
    @products = Product.all.sample(10)
  end
end

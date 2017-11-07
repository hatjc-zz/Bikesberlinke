class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def landing_page
  	@products = Product.limit(3)
  end
end

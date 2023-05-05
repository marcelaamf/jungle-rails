class Admin::DashboardController < ApplicationController
  def show
    @count = { products: Product.count, categories: Category.count}
  end
end

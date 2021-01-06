class Admin::SalesController < ApplicationController
  
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
  end

  def destroy
  end

  private
  def sales_params
    params.require(:sale).permit(
      :name,
      :starts_on,
      :ends_on,
      :percent_off    
    )
  end

end

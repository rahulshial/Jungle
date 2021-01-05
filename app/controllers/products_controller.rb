class ProductsController < ApplicationController

  def index
    #  uses MODEL
    @products = Product.all.order(created_at: :desc)
    
    # uses VIEW
    # render :index OR render 'index' - since the view name and the method name are same, this is implicit, and hence not written out here. But in the background, the index view is being rendered thru this method call from routes.rb --> root to: 'products#index'
    # index view is found in ./app/views/products/index.html.erb. However this need not be HTML, but can be anything else too.
    # render 'string' generally used when the view is in a different path and not within the MVC folder structure. for example - render 'sharedViews/index'
  end

  def show
    @product = Product.find params[:id]
  end

end

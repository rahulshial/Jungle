module SalesHelper

  def active_sale?
    # active is defined in the models/sales.rb.  basically returns the where clause
    @sale = Sale.active.any?
  end

end

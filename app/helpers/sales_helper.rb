module SalesHelper

  def active_sale?
    # active is defined in the models/sales.rb.  basically returns the where clause
    Sale.active.any?
  end

end

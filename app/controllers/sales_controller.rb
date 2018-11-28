class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    tax(@sale)
    redirect_to sales_done_path
  end

  def tax(sale)
    sale_dct = sale.value - sale.value * sale.discount / 100
    if sale.tax == 0
      tax_aux = 19
      sale_dct = sale.value + sale.value * tax_aux / 100
    else
      tax_aux = 0
    end
    sale.tax = tax_aux
    sale.total = sale_dct
    sale.save
  end

  def done
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end

end

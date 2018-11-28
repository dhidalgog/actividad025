class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    sale_dct = @sale.value - @sale.value * @sale.discount / 100
    if @sale.tax == 0
      tax_aux = 19
      @sale.total = sale_dct + sale_dct * tax_aux / 100
    else
      tax_aux = 0
    end
    @sale.tax = tax_aux
    @sale.save
    redirect_to action: :done, id: @sale.id
  end

  def done
    @sale = Sale.find(params[:id])
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end

end

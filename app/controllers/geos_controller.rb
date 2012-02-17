class GeosController < ApplicationController

 before_filter :load_unidades
 def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def geo
    unless params[:id].nil?
      @unidade = Unidade.find(params[:id])
    else
      if params[:unit].present?
        @unidade = Unidade.find(params[:unit][:id])
      end
    end
  end

end

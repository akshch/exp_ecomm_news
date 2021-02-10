class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.available
  end

  def import
    if csv_params[:file].present?
      result = Product.import_csv(csv_params[:file])
      if result[:success]
        render json: result, status: 200
      else
        render json: result, status: 422
      end
    else
      render json: { error: 'Please provide a csv file to create product data' }, status: 422
    end
  end

  def csv_params
    params.permit(:file)
  end

end
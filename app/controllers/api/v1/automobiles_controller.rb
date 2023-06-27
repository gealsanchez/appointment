module Api
  module V1
    # class AutomobilesController < ApplicationController
    class AutomobilesController < ApplicationController
      before_action :set_automobile, only: [:show, :update, :destroy]

      # GET /automobiles
      def index
        @automobiles = Automobile.all

        render json: @automobiles
      end

      # GET /automobiles/1
      def show
        render json: @automobile
      end

      # POST /automobiles
      def create
        @automobile = Automobile.new(automobile_params)

        if @automobile.save
          render json: @automobile, status: :created, location: @automobile
        else
          render json: @automobile.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /automobiles/1
      def update
        if @automobile.update(automobile_params)
          render json: @automobile
        else
          render json: @automobile.errors, status: :unprocessable_entity
        end
      end

      # DELETE /automobiles/1
      def destroy
        @automobile.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_automobile
        @automobile = Automobile.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def automobile_params
        params.require(:automobile).permit(:name)
      end
    end
  end
end

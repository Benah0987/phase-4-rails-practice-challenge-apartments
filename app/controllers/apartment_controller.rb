class ApartmentController < ApplicationController
    def create
        apartment = Apartment.new(apartment_params)
        if apartment.save
          render json: apartment, status: :created
        else
          render json: { error: apartment.errors.full_messages }, status: :unprocessable_entity
        end
     end

    #  fetching data READ ALL
    def index
        apartments = Apartment.all
        render json: apartments
    end 

    # showing a single user READ
    def show
        apartment = Apartment.find(params[:id])
        render json: apartment
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Apartment not found" }, status: :not_found
    end

    # UPDATE
    def update
        apartment = Apartment.find(params[:id])
        if apartment.update(apartment_params)
          render json: apartment
        else
          render json: { error: apartment.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Apartment not found" }, status: :not_found
      end
    # Delete an Apartment:
      def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Apartment not found" }, status: :not_found
      end
      
      
      
      
      
end

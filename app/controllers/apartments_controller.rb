class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show #"/apartments/:id"
        apartment = Apartment.find(params[:id])
        # apartment = Apartment.find_by(id: params[:id])

        if apartment
            render json: apartment
        else
            # render json: {error: "Apartment not found"}, status: 404
            render json: {error: "Apartment not found"}, status: :not_found

        end
    end

    def create
        # byebug
        apartment = Apartment.create(apartment_params)
        render json: apartment
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        render json: apartment
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        render json: {message: "Apartment is deleted"}
    end

    private

    def apartment_params
        params.permit(:number)
    end

end

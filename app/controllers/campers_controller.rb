class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer:CamperActivitySerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created

        # if camper
        #     render json: camper, status: :created
        # else 
        #     render json: {erorr: "Validation Error"}, status: :unprocessable_entity
        # end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: {error: "Camper Not Found"}, status: :not_found
    end

    def unprocessable_entity
        render json: {erorr: "Validation Error"}, status: :unprocessable_entity
    end

end

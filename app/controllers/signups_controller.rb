class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def unprocessable_entity
        render json: { error: "Validation Error" }, status: :unprocessable_entity 
    end
    
end

class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activities = Activity.find(params[:id])
        activities.destroy
        head :no_content
    end

    private 

    def render_not_found_response
        render json: {error: "Activity Not Found"}, status: :not_found
    end
end

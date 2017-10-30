class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]
    before_action :require_admin, only: [:new, :create, :edit, :destroy]
    def index
        @attractions = Attraction.all
    end

    def show
        @ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction && @attraction.save
            redirect_to attraction_path(@attraction)
        else
            flash[:alert] = user.errors.full_messages.join(", ")
            render 'new'
        end
    end

    def edit
    end

    def update
        if @attraction && @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            flash[:alert] = user.errors.full_messages.join(", ")
            render 'edit'
        end
    end

    def destroy
    end

    private

    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

    def require_admin
        redirect_to attraction_path(@attraction) unless current_user.admin
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
class SpicesController < ApplicationController
def index
    render json: Spice.all
end

def create
    spice = Spice.new(spice_params)
    if spice.save
    render json: spice, status: :created
    else
    render json: spice.errors, status: 422
    end
end

def update
    selected_spice = Spice.find_by(id: params[:id])
    if selected_spice
        selected_spice.update(spice_params)
        render json: selected_spice, status: 200
    else
        render json: selected_spice.errors, status: 422
    end
end

def destroy
    selected_spice = Spice.find_by(id: params[:id])
    if selected_spice
        selected_spice.destroy
        render json: selected_spice, status: 404
    else
        render json: {error: "Selected spice not found"}, status: :not_found
    end
end


    private

def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end



end

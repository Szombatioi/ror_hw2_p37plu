class LandsController < ApplicationController
    def show
        @land = Land.includes(:records).find_by(name: params[:name]) # Find land by its name
        if @land
            render :show
        else
            render plain: "Nem található a tájegység", status: :not_found
        end
    end
end

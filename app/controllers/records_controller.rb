class RecordsController < ApplicationController
    def show
        @land = Land.includes(:records).find_by(name: params[:name])
        @record = @land.records.find_by(id: params[:id])
        if @record
            render :show
        else
            render plain: "Nem található a felvétel", status: :not_found
        end
    end
end

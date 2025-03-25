class RecordsController < ApplicationController
    before_action :set_land

    def show
        @land = Land.includes(:records).find_by(name: params[:name])
        @record = @land.records.find_by(id: params[:id])
        if @record
            render :show
        else
            render plain: "Nem található a felvétel", status: :not_found
        end
    end

    def new
        @record = @land.records.build
    end
    
    def create
        @record = @land.records.build(record_params)
        if @record.save
            redirect_to @land, notice: 'Record was successfully created.'
        else
            render :new
        end
    end

    private

    def set_land
        @land = Land.find(params[:id])
    end

    def record_params
        params.require(:record).permit(:title, :lyrics, :link)
    end
end

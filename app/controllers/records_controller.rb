class RecordsController < ApplicationController
    before_action :set_land, only: [:new, :create, :edit, :update]
    before_action :set_record, only: [:edit, :update]

    def edit
        @lands = Land.all
    end

    def update
        if @record.update(record_params)
            redirect_to land_record_path(@land, @record), notice: 'Record updated successfully.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @land = Land.includes(:records).find_by(id: params[:land_id])
        @record = @land.records.includes(:comments).find_by(id: params[:id])
        if @record
            @comment = Comment.new
            render :show
        else
            render plain: "Nem található a felvétel", status: :not_found
        end
    end

    def new
        @record = @land.records.build
        @lands = Land.all
    end
    
    def create
        @record = @land.records.build(record_params)
        @record.uploader = current_user.username
        @record.date = Date.today

        if @record.save
            redirect_to land_path(id: @record.land.id), notice: 'Record was successfully created.'
        else
            render :new
        end
    end

    private

    def set_land
        @land = Land.find(params[:land_id])
    end

    def set_record
        @record = @land.records.find(params[:id])
    end

    def record_params
        params.require(:record).permit(:land_id, :title, :lyrics, :link)
    end
end

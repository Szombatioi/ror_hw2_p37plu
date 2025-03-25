class LandsController < ApplicationController
    def show
        @land = Land.includes(:records).find_by(id: params[:id]) 
        if @land
            render :show
        else
            render plain: "Nem található a tájegység", status: :not_found
        end
    end

    def new
        @land = Land.new
    end

    def create
        @land = Land.new(land_params)

        if Land.exists?(name: @land.name)
          flash.now[:alert] = "Már létezik ilyen nevű tájegység."
          render :new, status: :unprocessable_entity
          return
        end

        if @land.save
          # Save the uploaded file manually
          if params[:land][:img_name]
            image = params[:land][:img_name]
            filename = image.original_filename
            filepath = Rails.root.join('app', 'assets', 'images', filename)
    
            # Save the file to the assets/images directory
            File.open(filepath, 'wb') do |file|
              file.write(image.read)
            end
            @land.update(img_name: filename)
          end
    
           redirect_to root_path, notice: 'Tájegység felvéve.'
        else
          render :new
        end
      end
    
    def edit
    end

    private

    def land_params
        params.require(:land).permit(:name, :img_name)
    end
end

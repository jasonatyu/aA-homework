class AlbumsController < ApplicationController

    def new 
        @bands = Band.all
        @band = Band.find_by(id: params[:band_id])
        render :new 
    end 

    def create
        @album = Album.new(album_params)
        @band = Band.find_by(id: @album.band_id)
        if @album.save
            redirect_to album_url(@album)
        else 
            flash.now[:errors] = @album.errors.full_messages
            render :new 
        end
    end

    def show 
        @album = Album.find_by(id: params[:id])
        if @album
            render :show 
        else 
            redirect_to bands_url
        end
    end

    def edit 
        @bands = Band.all
        @album = Album.find_by(id: params[:id])
    end

    def update 
        @album = Album.new(album_params)
        if @album.update(album_params)
            redirect_to album_url(@album)
        else 
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        Album.delete(params[:id])
        redirect_to band_url(@album.band_id)
    end

    private
    def album_params 
        params.require(:album).permit(:title, :year, :is_live, :band_id)
    end

end

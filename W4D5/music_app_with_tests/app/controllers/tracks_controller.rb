class TracksController < ApplicationController
    def new 
        @albums = Album.all
        @album = Album.find_by(id: params[:album_id])
        render :new 
    end 

    def create
        @track = Track.new(track_params)
        if @track.save
            redirect_to track_url(@track)
        else 
            flash[:errors] = @track.errors.full_messages
            redirect_to new_album_track_url(track_params[:album_id])
        end
    end

    def show 
        @album = Album.find_by(id: params[:album_id])
        @track = Track.find_by(id: params[:id])
        @notes = @track.notes
        if @track 
            render :show
        else 
            redirect_to albums_url
        end 
    end 

    def destroy 
        @track = Track.find_by(id: params[:id])
        Track.delete(params[:id])
        redirect_to album_url(@track.album_id)
    end 

    private 
    def track_params
        params.require(:track).permit(:title, :ord, :album_id, :is_bonus, :lyrics)
    end
end

class NotesController < ApplicationController

    def new 
    end 

    def create 
        @note = Note.new(note_params)
        @note.user_id = current_user.id 
        @track = Track.find_by(id: @note.track_id)
        if @note.save 
            redirect_to track_url(@track)
        else
            flash[:errors] = @note.errors.full_messages
            redirect_to track_url(@track)
        end
    end 

    def show 
        @note = Note.find_by(id: params[:id])
        @track = Track.find_by(id: @note.track_id)
        if @note 
            redirect_to track_url(@track)
        else 
            redirect_to track_url(@track)
        end 
    end

    def destroy 
        @note = Note.find_by(id: params[:id])
        if current_user.id == @note.user_id 
            Note.delete(params[:id])
            redirect_to track_url(@note.track_id)
        else 
            render text: "You cannnot destory a comment you did not write.", status: 403
        end
    end 

    private
    def note_params
        params.require(:note).permit(:field, :track_id)
    end

end

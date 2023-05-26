class BookmarksController < ApplicationController
    def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new
    end 

    def create 
        @bookmark = Bookmark.new(bookmark_params)
        @list = List.find(params[:list_id])
        @bookmark.list = @list
        if @bookmark.save
            redirect_to root_path(@list)
        else 
            render :new, status: :unprocessable_entity 
        end 
    end 

    def delete
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
        redirect_to list_patch(@bookmark.list), status: :see_other
    end 

    private
    
    def set_bookmark
        @bookmark = Bookmark.find(params[:bookmark_id])
    end

    def bookmark_params 
        params.require(:bookmark).permit(:movie_id, :comment)
    end 

end

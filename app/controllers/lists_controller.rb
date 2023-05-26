class ListsController < ApplicationController
    before_action :set_list, only: :show
    
    def index 
        @lists = List.all 
    end 

    def show
        @bookmarks = @list.bookmarks
    end 
    
    def new
        @list = List.new 
    end

    def create
        @list = List.new(list_params)

        if @list.save 
            redirect_to root_path, notice: "List was successfully created." 
        else 
            render :new, status: :unprocessable_entitiy
        end 
    end 


    private

    def set_list
        @list = List.find(params[:id])
    end 

    def list_params
        params.require(:list).permit(:name)
    end 

end

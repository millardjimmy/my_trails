class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment
    before_action :set_trail
    before_action :redirect_if_not_comment_author, only: [:edit, :update, :destroy]

    
    def index
        @comments = Comment.all
    end 
    def new
        if  params[:trail_id]
            @comment = @trail.comments.build
        end
    end
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to trail_comment_path(@trail, @comment)
        else
            render :new
        end
    end
    def show
    end 
    def edit
    end 
    def update
        if @comment.update(comment_params)
            redirect_to trail_comment_path(@trail, @comment)
        else 
            render :edit
        end 
    end 
    def destroy
        @comment.destroy
        redirect_to trail_path(@trail)
    end 
    
    private
    def comment_params
        params.require(:comment).permit(:reply, :trail_id, :user_id)
    end
    def set_trail
        @trail = Trail.find_by(id: params[:trail_id])
    end 
    def set_comment
        @comment = Comment.find_by(id: params[:id])
    end
    def redirect_if_not_comment_author
        flash[:error] = "You can only edit your own trail."
        redirect_to trails_path if @comment.trail.user == current_user
    end
    

end

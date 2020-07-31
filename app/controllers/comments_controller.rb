class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        if params[:trail_id] && @trail = Trail.find_by_id(params[:trail_id])
            @trail = @trail.comments.build
        else
            @comment = Comment.new 
        end
    end
    def create
        @trail = trail.find_by_id(params[:trail_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to hilite_path(@comment.trail)
        else
            render :new
        end
    end
    private
    def comment_params
        params.require(:comment).permit(:reply, :trail_id, :user_id)
    end
end

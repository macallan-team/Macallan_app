class ReviewsController < ApplicationController

    def create
        @review = Review.new(review_params)
        @review.end_user_id = current_end_user.id
        @review.save
        redirect_to item_path(@review.item), :notice => "レビューしました。"
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to items_path, :alert => "レビューを削除しました。"
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to item_path(@review.item)
        else
            render :edit
        end
    end


# # ストロングパラメータ
private
def review_params
    params.require(:review).permit(:name, :comment, :item_id)
end





end

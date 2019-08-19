class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.end_user_id = current_end_user.id
        @review.save
        redirect_to item_path(@review.item)
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to items_path
    end

    def edit
        @item = Item.find(params[:id])
        @review = Review.find(params[:id])
        render :item_path
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to items_path(@item)
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

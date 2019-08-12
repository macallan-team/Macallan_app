class EndUsersController < ApplicationController

  def show
 @end_user = EndUser.find(params[:id])
  end
end

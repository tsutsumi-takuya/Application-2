class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id]) # ここを記述
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  	# ユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができ
  end
  def edit
  	@user = User.find(params[:id])
  	# params[:id]でユーザの情報を取得してインスタンス（@user）に保存
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
end
private 
def user_params
    params.require(:user).permit(:name, :profile_image)
end
end

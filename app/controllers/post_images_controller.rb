class PostImagesController < ApplicationController

	def index

	    @post_images = PostImage.all

	end

	def new

		@post_image = PostImage.new
		# インスタンス変数に空のインスタンスを渡して画像の投稿ができるように

    end
    def create

    	@post_image = PostImage.new(post_image_params)
    	# post_image_paramsフォームで入力されたデータが投稿データとして許可されているパラメータかどうかのチェック
	    @post_image.user_id = current_user.id
	    @post_image.save
	    redirect_to post_images_path
	    # PostImageモデルに保存した後、リダイレクトで投稿一覧画面へ

    end
    def show

    	 @post_image = PostImage.find(params[:id])
    	 @post_comment = PostComment.new
         
    end
	private
    def post_image_params

        params.require(:post_image).permit(:shop_name, :image, :caption)

    end

end
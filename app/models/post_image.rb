class PostImage < ApplicationRecord

	belongs_to :user
	# 単数形の「user」
	attachment :image 
	# ここを追加（_idは含めません）
	has_many :post_comments, dependent: :destroy
	# has_manyでPostCommentモデルを複数持つことを表している
end

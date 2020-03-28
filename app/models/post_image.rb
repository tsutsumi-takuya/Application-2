class PostImage < ApplicationRecord

	belongs_to :user
	# 単数形の「user」
	attachment :image
	# ここを追加（_idは含めません）
	has_many :post_comments, dependent: :destroy
	# has_manyでPostCommentモデルを複数持つことを表している
	has_many :favorites, dependent: :destroy
    validates :shop_name, presence: true
    validates :image, presence: true
    def favorited_by?(user)
	favorites.where(user_id: user.id).exists?
    # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか
    end
end

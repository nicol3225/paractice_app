class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def like_num(post_id)
        return Like.where(post_id:post_id).count
    end

    def like_count(user_id,post_id)
                # binding.pry

        return Like.where(user_id:user_id, post_id:post_id).count    
    end

end

class PostsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        post = find_posts
        post.create!(post_params)
        render json: post, status: :created
    end

    private

    def find_posts 
        Post.find_by(id: params[:id])
    end

    def post_params 
        params.permit(:title, :content, :summary, :category)
    end
    
    def render_not_found_response 
        render json: {error: 'Post not found'}, status: :not_found
    end
     
end



# create_table "posts", force: :cascade do |t|
#     t.string "title"
#     t.text "content"
#     t.text "summary"
#     t.string "category"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end
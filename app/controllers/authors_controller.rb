class AuthorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    
    def create
        author = find_author 
        author.create!(author_params)
        if person.valid? 
            render json: author, status: :created
        else
            render json: {error: person.errors.full_messages}, status: :unprocessable_entity
    end


    private 

    def find_author 
        Author.find_by(id: params[:id])
    end

    def author_params 
        params.permit(:name, :phone_number) 
    end

    def render_not_found_response 
        render json: {error: 'Author not found'}, status: :not_found
    end


end

# create_table "authors", force: :cascade do |t|
#     t.string "name"
#     t.string "phone_number"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   create_table "posts", force: :cascade do |t|
#     t.string "title"
#     t.text "content"
#     t.text "summary"
#     t.string "category"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

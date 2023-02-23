class Post < ApplicationRecord
    # All posts have a title 
    validates :title, presence: true

    # Post content is at least 250 characters long 
    validates :content, length: { minimum: 250}

    # Post Summary is max of 250 characters 
    validates :summary, length: {maximum: 250} 

    # Post category is either Fiction or non-fiction 
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    # Custom: 
    # validate :clickbait

    # def clickbait 
    #     if title != "Won't Believe" || "Secret" || "Top [number]" || "Guess"
    #         errors.add(:title, 'cllick bait')
    #     end 
    # end 
end

class Post < ApplicationRecord
    validates :title, presence: true

    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]} 

    # validate :title, inclusion{in: ["Won't Believe","Secret","Top [number]","Guess"]}
    custom_patterns =[
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def clickbait?
        if custom_patterns.none? {|cus| cus.match title}
        error.add(:title, "must be clickbait")
        end
    end 
end

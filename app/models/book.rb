class Book < ApplicationRecord
	belongs_to :user
    has_many :book_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end
    
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
    
    
    def self.looks(searches, words)
        if    searches == "perfect_match"
            @book = Book.where("title LIKE ?","#{words}")
        elsif searches == "backward_match"
            @book = Book.where("title LIKE ?", "%#{words}")
        elsif searches ==  "forward_match"
            @book = Book.where("title LIKE ?", "#{words}%")
        elsif searches == "pertial_match"
            @book = Book.where("title LIKE ?", "%#{words}%")
        end
    end
    
    def self.categories(words)
        @word = Book.where("category LIKE ?", "#{words}")
    end

end

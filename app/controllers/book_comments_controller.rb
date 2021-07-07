class BookCommentsController < ApplicationController

  def create
<<<<<<< HEAD
    @book = Book.find(params[:book_id])
    @book_comments = @book.book_comments
=======
    book = Book.find(params[:book_id])
    @book_comments = book.book_comments
>>>>>>> star-review
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
  end
  
  def destroy
<<<<<<< HEAD
    @book = Book.find(params[:book_id])
    @book_comments = @book.book_comments
    BookComment.find(params[:id]).destroy
=======
    book = Book.find(params[:book_id])
    @book_comments = book.book_comments
    BookComment.find(params[:id]).destroy!
>>>>>>> star-review
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

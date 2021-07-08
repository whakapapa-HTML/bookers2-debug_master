class BooksController < ApplicationController
   before_action :authenticate_user! 
   before_action :ensure_correct_user, only:[:edit, :update, :destroy]


  def show
    @newbook = Book.new
    @book_comment = BookComment.new
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comments = @book.book_comments
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def ascending
    @books = Book.order(evaluation: :desc)
    @book = Book.new
    @user = current_user
  end
  
  def newest
    @books = Book.order(created_at: :desc)
    @book = Book.new
    @user = current_user
    
  end
  
  private

    def book_params
      params.require(:book).permit(:title,:body,:evaluation)
    end
    
    def ensure_correct_user
      @book = Book.find(params[:id])
      unless @book.user == current_user
        redirect_to books_path
      end
    end

end

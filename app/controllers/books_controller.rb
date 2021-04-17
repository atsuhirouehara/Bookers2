class BooksController < ApplicationController
    
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @user = current_user
   if @book.save
    redirect_to book_path(@book.id), :notice => "Book was successfully created."
   else
    @books = Book.all
    render :index
   end 
  end
  
  def users
    @users = User.all
    @user = current_user
  end 

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render :edit
    else
       redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @user = current_user
   if @book.update(book_params)
    redirect_to book_path(@book.id), :notice =>  "Book was successfully updated."
   else
    render :edit
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
     redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end

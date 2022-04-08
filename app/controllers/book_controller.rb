class BookController < ApplicationController

   # display all books  (home page)
   def index
      @books = Book.all
   end

   #display details of one book
   def show
      book_id = params[:id]
      @book = Book.find_book(book_id)
      
   end
  
   #get user input to add a new book 
   def new
      @book = Book.new
      @subjects = Subject.all
   end

   #add a new book
   def create
     #building a book instance variable with parameters passed
      @book = Book.new(book_params)
     
      if @book.create_book #calling create method in the model
        flash[:alert] = "Book added successfully!"
        redirect_to book_index_path
      else
        flash[:alert] = "Couldn't add book!"
        @subjects = Subject.all
        render :new
      end
      
   end
   
   #get user input to update details of existing book
   def edit
      @book = Book.find_book(params[:id])
      @subjects = Subject.all
   end
   
   #update existing book
   def update
     
      book_id = params[:id] 
      
      if Book.update_book(book_id,book_param)
        flash[:alert] = "Updated successfully!"
        redirect_to book_path(book_id)

      else
        flash[:alert] = "Couldn't be updated!"
        @subjects = Subject.all
        render :edit
      end

   end
   
   #delete a book
   def destroy

      if Book.delete_book(params[:id])      
        flash[:alert] = "Book deleted successfully!" 
        redirect_to book_index_path
      else
        flash[:alert] = "Couldn't be deleted!"
      end

   end

   #display all subjects
   def show_subjects
      @subject = Subject.find(params[:id])
      
   end
   
   private
   def book_param
      params.require(:book).permit(:title, :price, :subject_id, :description)
   end
    
   def book_params
      params.require(:books).permit(:title, :price, :subject_id, :description)
   end
   
 
 end
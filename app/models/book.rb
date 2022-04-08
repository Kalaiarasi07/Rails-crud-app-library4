class Book < ApplicationRecord
    belongs_to :subject
    validates_presence_of :title
    validates_numericality_of :price, :message=>"Error Message"    


   
    def create_book
        return 1 if self.save #inserting the record in db table
        return 0
    end

    def self.find_book(book_id)
        Book.find(book_id)
    end

    def self.update_book(book_id,book_param)
        
        @book = Book.find(book_id)
        
        return 1 if @book.update(book_param)
        return 0
        
    end

    def self.delete_book(book_id)
        return 1 if Book.find(book_id).destroy
        return 0
    end

    def func
        "hello"
    end
     
end

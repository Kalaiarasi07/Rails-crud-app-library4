require 'rails_helper'

RSpec.describe Book, type: :request do

  #checks routing
  it 'returns index page' do
    get '/book'
    expect(response).to have_http_status(:success)
  end 

  it 'checks if book can be created' do
    @book = Book.create(id: nil, title: "B100", price: 50.0, subject_id: "3", description: "Book 100", created_at: nil)
    # case: success
    expect(@book).to be_valid

    # # case: failure
    @book = Book.create(id: nil, title: "B100", price: "abc", subject_id: "3", description: "Book 100", created_at: nil)
    expect(@book).to be_invalid
  end
  
  it 'checks that a book can be read' do
    
    @book = Book.create(id: nil, title: "B101", price: 50.0, subject_id: "3", description: "BOOK 101", created_at: nil)
    
    #case: success
    expect(Book.find_by_title("B101")).to eq(@book)

    # #case: failure
    # expect(Book.find_by_title("B73")).to eq(@book)

  end
  
  it 'checks that a book can be updated' do
    
    @book = Book.create(id: nil, title: "B102", price: 50.0, subject_id: "3", description: "Book 102 ", created_at: nil)
    
    # case: success
    @book.update(:title => "Book102")
    expect(Book.find_by_title("Book102")).to eq(@book)

    # #case: failure
    # @book.update(:title => "Book102")
    # expect(Book.find_by_title("B102")).to eq(@book)

  end

  it 'checks that a book can be destroyed' do
    @book = Book.create(id: nil, title: "B103", price: 50.0, subject_id: "3", description: "Book 103", created_at: nil)
    @book.destroy

    #case: success
    expect(Book.find_by(title: "B103")).to be_nil

    #case: failure
    # expect(Book.find_by(title: "B103")).to @book
  end
  

end

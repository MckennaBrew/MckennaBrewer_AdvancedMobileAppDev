//
//  BookDataLoader.swift
//  BooksToRead
//
//  Created by Mckenna Brewer on 2/14/21.
//

import Foundation

class BookDataLoader{
    
    var bookData = [BookData]()
    
    func loadBooks(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                
                //decodes the property list
                bookData = try plistdecoder.decode([BookData].self, from: data)
            }
            catch {
                // handle error
                print(error)
            }
        }
    }
    
    
    // Get Book Data Methods
    
    func getGenres() -> [String]{
        var genres = [String]()
        
        for item in bookData{
            genres.append(item.genre)
        }
        return genres
    }
    
    func getBooks(index: Int) -> [String]{
        return bookData[index].books
    }
    
    // Add and Delete Book Methods
    
    func addBook(index:Int, newBook:String, newIndex:Int){
        bookData[index].books.insert(newBook, at: newIndex)
    }
    
    func deleteBook(index:Int, bookIndex: Int){
        bookData[index].books.remove(at: bookIndex)
    }
    
    
}

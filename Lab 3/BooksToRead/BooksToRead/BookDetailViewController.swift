//
//  BookDetailViewController.swift
//  BooksToRead
//
//  Created by Mckenna Brewer on 2/14/21.
//

import UIKit

class BookDetailViewController: UITableViewController {
    
    var genreData = BookDataLoader()
    var selectedGenre = 0
    var bookList = [String]()
    var searchController = UISearchController()
    
    var bookSearchList = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        bookList = genreData.getBooks(index: selectedGenre)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        bookSearchList = genreData.getBooks(index: selectedGenre)
        
        let resultsController = BookSearchViewController()
        resultsController.allBooks = bookSearchList
        searchController = UISearchController(searchResultsController: resultsController)
        
        searchController.searchBar.placeholder = "Search for a book"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = resultsController
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = bookList[indexPath.row]

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
          
            // delete book from the array
            bookList.remove(at: indexPath.row)
            
            // delete row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // delete  from data model instance
            genreData.deleteBook(index: selectedGenre, bookIndex: indexPath.row)
            
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
        let fromRow = fromIndexPath.row // row being mved from
        let toRow = to.row // row being moved to
        let moveBook = bookList[fromRow] // book being moved
        
        //swap positions in array
        bookList.swapAt(fromRow, toRow)
        
        //move in data model instance
        genreData.deleteBook(index: selectedGenre, bookIndex: fromRow)
        genreData.addBook(index: selectedGenre, newBook: moveBook, newIndex: toRow)

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        if segue.identifier == "doneSegue"{
            if let source = segue.source as? AddBookViewController {
                // only want to add a country if there is text entered in the text field
                if source.addedBook.isEmpty == false{
                    
                    // add country to our data model instance
                    genreData.addBook(index: selectedGenre, newBook: source.addedBook, newIndex: bookList.count)
                    
                    // add country to array
                    bookList.append(source.addedBook)
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    
    //UITableViewDelegate method that is called when a row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Book selected", message: "You chose \(bookList[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been chosen
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

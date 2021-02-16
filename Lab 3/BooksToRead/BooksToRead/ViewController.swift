//
//  ViewController.swift
//  BooksToRead
//
//  Created by Mckenna Brewer on 2/14/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var libraryList = [String]()
    var libraryData = BookDataLoader()
    let dataFile = "library"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        libraryData.loadBooks(filename: dataFile)
        libraryList = libraryData.getGenres()
        
        //enables large titles
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryList.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreIdentifier", for: indexPath)
        cell.textLabel?.text = libraryList[indexPath.row]
        return cell
    }
    
    // sends correct book data to new table view when a genre is selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookSegue" {
            if let bookDetailVC = segue.destination as? BookDetailViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!) {
                    //sets the data for the destination controller
                    bookDetailVC.title = libraryList[indexPath.row]
                    bookDetailVC.genreData = libraryData
                    bookDetailVC.selectedGenre = indexPath.row
                }
            }
        }
    }
    
    


}


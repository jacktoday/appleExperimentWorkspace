//
//  ViewController.swift
//  StoreSearch
//
//  Created by fulin on 17/10/21.
//

import UIKit

class ViewController: UIViewController {

    
    struct TableView {
        struct CellIdentifiers {
            static let searchResultCell = "SearchResultCell"
            static let nothingFoundCell = "NothingFoundCell"
        }
    }
    
    var hasSearched = false
    
    var searchResults = [SearchResult]()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func iTunesURL(searchText: String) -> URL {
        let urlString = String(format: "https://itunes.apple.com/search?term=%@", searchText)
        let url = URL(string: urlString)
        return url!
    }
    
    func performStoreRequest(with url: URL) -> Data? {
        do {
            //return try String(contentsOf: url, encoding: .utf8)
            return try Data(contentsOf: url)
        } catch {
            print("******download error: \(error.localizedDescription)")
            showNetworkError()
            return nil
        }
        
        
    }
    
    func parse(data: Data) -> [SearchResult] {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResultArray.self, from: data)
            return result.results
        } catch {
            print("JSON error: \(error)")
            return []
        }
    }
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Whoops.....", message: "There was an error accessing the itunes store. please try again.", preferredStyle: .alert)
        
        let aciton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(aciton)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // tableView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: 0, right: 0)
        
        
        let cellNib = UINib(nibName: TableView.CellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.searchResultCell)
        let cellNothingNib = UINib(nibName: TableView.CellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(cellNothingNib, forCellReuseIdentifier: TableView.CellIdentifiers.nothingFoundCell)
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !hasSearched {
            return 0
        }
        else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = TableView.CellIdentifiers.searchResultCell
      
        
        if searchResults.count == 0 {
            
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.nothingFoundCell)
            
           // cell.nameLabel.text = "nothing found"
           // cell.detailTextLabel!.text = ""
            return cell
        }
        else {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.searchResultCell) as! SearchResultCell
            
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
            //cell.detailTextLabel!.text = searchResult.artiseName
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
    
    
    
    
    
}


extension ViewController: UISearchBarDelegate {
    

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            
            print("search text is: '\(searchBar.text)'")
            hasSearched = true
            searchResults = []
            let url = iTunesURL(searchText: searchBar.text!)
            print("URL: '\(url)'")
             
            /*if let jsonString = performStoreRequest(with: url) {
                print("received JSON string '\(jsonString)'")
            }*/
            if let data = performStoreRequest(with: url) {
                //let results = parse(data: data)
                searchResults = parse(data: data)
                searchResults.sort { $0.name.localizedStandardCompare($1.name) == .orderedAscending }
                    
                
                    //print("Got results:'\(results)'")
            }
            tableView.reloadData()
        }
        
    }
    
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

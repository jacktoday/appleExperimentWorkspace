//
//  ViewController.swift
//  StoreSearch
//
//  Created by fulin on 17/10/21.
//

import UIKit

class ViewController: UIViewController {

    var hasSearched = false
    
    var searchResults = [SearchResult]()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // tableView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: 0, right: 0)
        
        
        
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
        let cellIdentifier = "SearchResultCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            
        }
        
        if searchResults.count == 0 {
            cell.textLabel!.text = "nothing found"
           // cell.detailTextLabel!.text = ""
        }
        else {
            let searchResult = searchResults[indexPath.row]
            cell.textLabel!.text = searchResult.name
            //cell.detailTextLabel!.text = searchResult.artiseName
        }
        return cell
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
        searchBar.resignFirstResponder()
        print("search text is: \(searchBar.text)")
        searchResults = []
        for i in 0...10 {
            let searchResult = SearchResult()
            searchResult.name = String(format: "name:  %d", i)
            searchResult.artiseName = searchBar.text!
            searchResults.append(searchResult)
        }
        hasSearched = true
        tableView.reloadData()
        
    }
    
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

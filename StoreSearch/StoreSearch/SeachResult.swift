//
//  SeachResult.swift
//  StoreSearch
//
//  Created by fulin on 17/10/21.
//

import Foundation

class SearchResult: Codable, CustomStringConvertible {
    var description: String {
        return "\n Result - Name: \(name), Artist Name: \(artistName ?? "None"), Kind: \(kind ?? "None")"
    }
    
    var artistName: String? = ""
    var trackName: String? = ""
    var name: String {
        return trackName ?? ""
    }
    var kind: String? = ""
}



class ResultArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

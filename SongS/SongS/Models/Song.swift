//
//  Song.swift
//  SongS
//
//  Created by fulin on 23/1/22.
//

import Foundation


struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}

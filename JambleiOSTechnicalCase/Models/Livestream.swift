//
//  Livestream.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Foundation

final class Livestream: Identifiable {
    
    init(title: String, peopleWatching: Int?, likeAmount: Int, finishDate: Date?, image: String, bookmark: Bool = false) {
        self.title = title
        self.peopleWatching = peopleWatching
        self.likeAmount = likeAmount
        self.finishDate = finishDate
        self.image = image
        self.bookmarked = bookmark
    }
    
    let id: UUID = UUID()
    let title: String
    let peopleWatching: Int?
    let likeAmount: Int
    let finishDate: Date?
    let image: String
    var bookmarked: Bool = false
    
}

//
//  Review.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import Foundation

final class Review: Identifiable {
    
    init(username: String, pic: String, rating: Int, date: Date, description: String) {
        self.username = username
        self.pic = pic
        self.rating = rating
        self.date = date
        self.description = description
    }
    
    let id: UUID = UUID()
    let username: String
    let pic: String
    let rating: Int
    let date: Date
    let description: String
    
}

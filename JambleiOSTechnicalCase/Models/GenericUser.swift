//
//  GenericUser.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Foundation

class GenericUser {
    
    init(name: String, username: String, joined: Date, bio: String, pic: String, averageShippingDays: Float, averageRating: Float, totalRatings: Int, followersAmount: Int, leaderBoardPosition: Int) {
        self.name = name
        self.username = username
        self.joined = joined
        self.bio = bio
        self.pic = pic
        self.averageShippingDays = averageShippingDays
        self.averageRating = averageRating
        self.totalRatings = totalRatings
        self.followersAmount = followersAmount
        self.leaderBoardPosition = leaderBoardPosition
    }
    
    var name: String
    var username: String
    var joined: Date
    var bio: String
    var pic: String
    var averageShippingDays: Float
    var averageRating: Float
    var totalRatings: Int
    var followersAmount: Int
    var leaderBoardPosition: Int
    
    
}

//
//  UserReviewInfo.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

final class UserReviewInfo {
    
    init(averageScore: Float, reviewAmount: Int) {
        self.averageScore = averageScore
        self.reviewAmount = reviewAmount
    }
    
    let averageScore: Float
    let reviewAmount: Int
    
}

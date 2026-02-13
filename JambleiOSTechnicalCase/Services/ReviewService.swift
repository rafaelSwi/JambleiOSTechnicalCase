//
//  LivestreamService.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Foundation

final class ReviewService {
    
    func fetchMainUserReviewInfo() async throws -> UserReviewInfo {
        
        try await Task.sleep(nanoseconds: UInt64(DebugSettings.delayFetchReviews))
        
        return UserReviewInfo(averageScore: 4.9, reviewAmount: 6950)
        
    }
    
    func fetchMainUserReviews(page: Int) async throws -> [Review] {
        
        try await Task.sleep(nanoseconds: UInt64(DebugSettings.delayFetchReviews))
        
        if DebugSettings.noResultsForReviews {
            return []
        }
        
        let page0content = [
            Review(
                username: "Stefan_001",
                pic: "avatar-02",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Loved it",
            ),
            Review(
                username: "Gabriel_TCG",
                pic: "avatar-03",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Thank You",
            ),
            Review(
                username: "Rose",
                pic: "avatar-05",
                rating: 2,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Not very good but ok",
            ),
            Review(
                username: "Mayara",
                pic: "avatar-06",
                rating: 4,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Good!",
            ),
        ]
        
        let page1content = [
            Review(
                username: "Elisa",
                pic: "avatar-08",
                rating: 1,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "not good",
            ),
            Review(
                username: "Johannes",
                pic: "avatar-07",
                rating: 1,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Terrible!",
            ),
            Review(
                username: "Suzan",
                pic: "avatar-09",
                rating: 4,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Ok",
            ),
            Review(
                username: "Enzo",
                pic: "avatar-10",
                rating: 1,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "very bad",
            ),
            Review(
                username: "Elsa",
                pic: "avatar-11",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Amazing",
            ),
        ]
        
        let page2content = [
            Review(
                username: "Miah",
                pic: "avatar-12",
                rating: 4,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Nice",
            ),
            Review(
                username: "Fred",
                pic: "avatar-13",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Good",
            ),
            Review(
                username: "Joana",
                pic: "avatar-14",
                rating: 3,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Meh, its okay",
            ),
            Review(
                username: "Monica",
                pic: "avatar-15",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Amazing",
            ),
            Review(
                username: "Alice",
                pic: "avatar-16",
                rating: 3,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "dont recommend",
            ),
            Review(
                username: "Igor",
                pic: "avatar-17",
                rating: 3,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "nah idk",
            ),
        ]
        
        let page3content = [
            Review(
                username: "Arlete",
                pic: "avatar-18",
                rating: 4,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "good",
            ),
            Review(
                username: "Jair",
                pic: "avatar-19",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "very good",
            ),
            Review(
                username: "Carla",
                pic: "avatar-20",
                rating: 5,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Good",
            ),
            Review(
                username: "Juan",
                pic: "avatar-21",
                rating: 4,
                date:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                description: "Good",
            ),
        ]
        
        if page == 0 {
            return page0content
        } else if page == 1 {
            return page1content
        } else if page == 2 {
            return page2content
        } else if page == 3 {
            return page3content
        } else {
            return []
        }
        
    }
    
}

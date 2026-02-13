//
//  BookmarkService.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import Foundation

final class BookmarkService {
    
    func fetchBookmarks(page: Int) async throws -> [Livestream] {
        
        try await Task.sleep(nanoseconds: UInt64(DebugSettings.delayFetchBookmarks))
        
        if DebugSettings.noResultsForBookmarks {
            return []
        }
        
        let page0content = [
            Livestream(title: "Come here see my cards!",
                       peopleWatching: nil,
                       likeAmount: 46,
                       finishDate: Date(timeIntervalSince1970: TimeInterval(1624322504)),
                       image: "live-cover-05",
                       bookmark: true,
                      ),
            Livestream(title: "My cozy gaming setup",
                       peopleWatching: nil,
                       likeAmount: 76,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1223311800)),
                       image: "live-cover-06",
                       bookmark: true,
                      ),
            Livestream(title: "Final view of my giant pokemon cards collection",
                       peopleWatching: nil,
                       likeAmount: 21,
                       finishDate: nil,
                       image: "live-cover-07",
                       bookmark: true,
                      ),
            Livestream(title: "COME JOIN MY AMAZING LIVESTREAM",
                       peopleWatching: nil,
                       likeAmount: 98,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                       image: "live-cover-04",
                       bookmark: true,
                      ),
        ]
        
        let page1content = [
            Livestream(title: "UNCHARTED 4 LIVESTREAM",
                       peopleWatching: nil,
                       likeAmount: 31,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591215201)),
                       image: "live-cover-15",
                       bookmark: true,
                      ),
            Livestream(title: "COME LOOK MY POKEMON CARDS, PEOPLE!",
                       peopleWatching: nil,
                       likeAmount: 1,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591415200)),
                       image: "live-cover-08",
                       bookmark: true,
                      ),
        ]
        
        if page == 0 {
            return page0content
        } else if page == 1 {
            return page1content
        } else {
            return []
        }
        
    }
    
}

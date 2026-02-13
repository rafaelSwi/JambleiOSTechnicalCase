//
//  LivestreamService.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Foundation

final class LivestreamService {
    
    func fetchMainUserLivestreams(page: Int) async throws -> [Livestream] {
        
        try await Task.sleep(nanoseconds: UInt64(DebugSettings.delayFetchLivestreams))
        
        if DebugSettings.noResultsForLivestreams {
            return []
        }
        
        let page0content = [
            Livestream(title: "Folks, meet my pokemon collection!",
                       peopleWatching: 96,
                       likeAmount: 130,
                       finishDate: nil,
                       image: "live-cover-01"
                      ),
            Livestream(title: "Here's a look at my cozy pink room",
                       peopleWatching: nil,
                       likeAmount: 46,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                       image: "live-cover-02"
                      ),
            Livestream(title: "Please enter my livestream guys",
                       peopleWatching: nil,
                       likeAmount: 46,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                       image: "live-cover-03"
                      ),
            Livestream(title: "COME JOIN MY AMAZING LIVESTREAM",
                       peopleWatching: nil,
                       likeAmount: 98,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                       image: "live-cover-04"
                      ),
        ]
        
        let page1content = [
            Livestream(title: "HY GUYS IM LIVE PLAYING NINTENDO SWITCH PLEASE JOIN",
                       peopleWatching: 23,
                       likeAmount: 87,
                       finishDate: nil,
                       image: "live-cover-05"
                      ),
            Livestream(title: "Im from brazil, come talk with me",
                       peopleWatching: nil,
                       likeAmount: 54,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591315200)),
                       image: "live-cover-06"
                      ),
            Livestream(title: "Walking around Sao Paulo at night searching for people to play pokemon",
                       peopleWatching: nil,
                       likeAmount: 31,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591215201)),
                       image: "live-cover-07"
                      ),
            Livestream(title: "COME LOOK MY POKEMON CARDS, PEOPLE!",
                       peopleWatching: nil,
                       likeAmount: 1,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591415200)),
                       image: "live-cover-08"
                      ),
        ]
        
        let page2content = [
            Livestream(title: "Walking around san francisco",
                       peopleWatching: 65,
                       likeAmount: 34,
                       finishDate: nil,
                       image: "live-cover-09"
                      ),
            Livestream(title: "playing zelda breath of the wild for the first time",
                       peopleWatching: nil,
                       likeAmount: 7,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1521315200)),
                       image: "live-cover-10"
                      ),
            Livestream(title: "which zelda is the best? open discussion topic",
                       peopleWatching: nil,
                       likeAmount: 87,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1591345200)),
                       image: "live-cover-11"
                      ),
            Livestream(title: "PLAYING A GAME",
                       peopleWatching: nil,
                       likeAmount: 4,
                       finishDate:  Date(timeIntervalSince1970: TimeInterval(1224312500)),
                       image: "live-cover-12"
                      ),
        ]
        
        if page == 0 {
            return page0content
        } else if page == 1 {
            return page1content
        } else if page == 2 {
            return page2content
        } else {
            return []
        }
        
    }
    
}

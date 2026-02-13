//
//  UserBookmarksViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine
import Foundation

@MainActor
final class UserBookmarksViewModel: ObservableObject {
    
    @Published var bookmarkedlivestreams: [Livestream] = []
    private var bookmarkService: BookmarkService
    @Published var errorMessage: String? = nil
    
    @Published var page: Int = 0
    @Published var end: Bool = false
    
    init(bookmarks: [Livestream], bookmarkService: BookmarkService) {
        self.bookmarkedlivestreams = bookmarks
        self.bookmarkService = bookmarkService
    }
    
    var nothingToFetch: Bool {
        return bookmarkedlivestreams.isEmpty && page != 0
    }
    
    func refreshAction() {
        bookmarkedlivestreams.removeAll()
        end = false
        page = 0
        Task {
            await getBookmarkedLivestreams()
        }
    }
    
    func getBookmarkedLivestreams() async {
        
        if DebugSettings.forceErrorFetchBookmarks {
            self.errorMessage = "Intentional error while attempting to fetch bookmarks"
            return
        }
        
        print("getBookmarkedLivestreams function called!")
        if end {
            print("no more bookmarked livestreams to fetch")
            return
        }
        do {
            var collectedLivestreams: [Livestream] = []
            try await collectedLivestreams += bookmarkService.fetchBookmarks(page: self.page)
            if collectedLivestreams.isEmpty {
                end = true
            } else {
                bookmarkedlivestreams += collectedLivestreams
            }
            self.page += 1
            errorMessage = nil
        } catch is CancellationError {
            print("silent CancellationError on fetching bookmarks")
        } catch {
            self.errorMessage = "Error trying to fetch bookmarks"
        }
    }
    
    
}

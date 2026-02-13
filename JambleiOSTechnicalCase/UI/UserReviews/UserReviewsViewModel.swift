//
//  UserReviewsViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine

@MainActor
final class UserReviewsViewModel: ObservableObject {
    
    @Published var reviews: [Review] = []
    @Published var userReviewsInfo: UserReviewInfo?
    private var reviewsService: ReviewService
    
    @Published var page: Int = 0
    @Published var end: Bool = false
    @Published var errorMessage: String? = nil
    
    init(reviews: [Review], reviewService: ReviewService) {
        self.reviews = reviews
        self.reviewsService = reviewService
    }
    
    func refreshAction() {
        reviews.removeAll()
        userReviewsInfo = nil
        end = false
        page = 0
        Task {
            await getReviews()
        }
    }
    
    var nothingToFetch: Bool {
        return reviews.isEmpty && page != 0
    }
    
    func getUserReviewInfo() async {
        
        if DebugSettings.forceErrorFetchUserReviewInfo {
            self.errorMessage = "Intentional error while attempting to fetch the user's reviews info"
            return
        }
        
        print("getUserReviewInfo function called!")
        do {
            let collectedInfo = try await reviewsService.fetchMainUserReviewInfo()
            userReviewsInfo = collectedInfo
            errorMessage = nil
        } catch is CancellationError {
            print("silent CancellationError trying to fetch user info reviews")
        } catch {
            self.errorMessage = "Error trying to fetch user info reviews"
        }
        
    }
    
    func getReviews() async {
        
        if DebugSettings.forceErrorFetchReviews {
            self.errorMessage = "Intentional error while attempting to fetch reviews"
            return
        }
        
        print("getReviews function called!")
        if end {
            print("no more reviews to fetch")
            return
        }
        do {
            var collectedReviews: [Review] = []
            try await collectedReviews += reviewsService.fetchMainUserReviews(page: self.page)
            if collectedReviews.isEmpty {
                end = true
            } else {
                reviews += collectedReviews
            }
            self.page += 1
            errorMessage = nil
        } catch is CancellationError {
            print("silent CancellationError trying to fetch reviews")
        } catch {
            self.errorMessage = "Error trying to fetch reviews"
        }
    }
    
}

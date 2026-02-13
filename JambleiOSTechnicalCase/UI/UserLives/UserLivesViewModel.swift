//
//  UserLivesViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine

@MainActor
final class UserLivesViewModel: ObservableObject {
    
    @Published var livestreams: [Livestream] = []
    private var livestreamService: LivestreamService
    @Published var errorMessage: String? = nil
    
    @Published var page: Int = 0
    @Published var end: Bool = false
    
    init(livestreams: [Livestream], livestreamService: LivestreamService) {
        self.livestreams = livestreams
        self.livestreamService = livestreamService
    }
    
    func refreshAction() {
        livestreams.removeAll()
        end = false
        page = 0
        Task {
            await getLivestreams()
        }
    }
    
    var nothingToFetch: Bool {
        return livestreams.isEmpty && page != 0
    }
    
    func getLivestreams() async {
        
        if DebugSettings.forceErrorFetchLivestreams {
            self.errorMessage = "Intentional error while attempting to fetch livestreams"
            return
        }
        
        print("getLivestreams function called!")
        if end {
            print("no more livestreams to fetch")
            return
        }
        do {
            var collectedLivestreams: [Livestream] = []
            try await collectedLivestreams += livestreamService.fetchMainUserLivestreams(page: self.page)
            if collectedLivestreams.isEmpty && !livestreams.isEmpty {
                end = true
            } else {
                livestreams += collectedLivestreams
            }
            self.errorMessage = nil
            self.page += 1
        } catch is CancellationError {
            print("silent cancellationerror trying to fetch livestreams")
        } catch {
            self.errorMessage = "Error trying to fetch livestreams"
        }
    }
    
}

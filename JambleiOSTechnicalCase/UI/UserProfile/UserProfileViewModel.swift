//
//  UserProfileViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine

@MainActor
final class UserProfileViewModel: ObservableObject {
    
    @Published var user: GenericUser?
    private let userService: UserService?
    
    @Published var selection: Int = 0
    
    @Published var errorMessage: String? = nil
    
    init(user: GenericUser? = nil, userService: UserService) {
        self.user = user
        self.userService = userService
    }
    
    func getMainUser() async {
        
        if DebugSettings.forceErrorFetchProfile {
            self.errorMessage = "Intentional error while attempting to fetch your profile"
            return
        }
        
        do {
            user = try await userService?.fetchMainUser()
            errorMessage = nil
        } catch is CancellationError {
          print("silent CancellationError trying to fetch profile")
        } catch {
            self.errorMessage = "Error trying to fetch profile"
        }
    }
    
}

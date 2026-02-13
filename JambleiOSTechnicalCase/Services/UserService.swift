//
//  UserService.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Foundation

final class UserService {
    
    func fetchMainUser() async throws -> GenericUser {
        
        try await Task.sleep(nanoseconds: UInt64(DebugSettings.delayFetchUserProfile))
        
        let genericUser = GenericUser(name: "Felipe Sanchez",
                                      username: "felipe_shop",
                                      joined: Date(timeIntervalSince1970: TimeInterval(1591315200)),
                                      bio: "Dealer de sneakers. Drops hebdomadaires, contact en DM pour toute question. Comme vous pouvez le constater, ma bio est en réalité beaucoup plus longue !",
                                      pic: "avatar-01",
                                      averageShippingDays: 5.2,
                                      averageRating: 4.8,
                                      totalRatings: 112,
                                      followersAmount: 1600,
                                      leaderBoardPosition: 120
        )
        
        return genericUser
        
    }
    
}

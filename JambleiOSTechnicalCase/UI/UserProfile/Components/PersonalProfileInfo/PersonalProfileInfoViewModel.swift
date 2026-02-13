//
//  PersonalProfileInfoViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine
import CoreFoundation
import Foundation

@MainActor
final class PersonalProfileInfoViewModel: ObservableObject {
    
    init(user: GenericUser?) {
        self.user = user
    }
    
    @Published var user: GenericUser?
    
    @Published var bioText: String = ""
    
    let imageSize: CGFloat = 83
    
    let smallIconSize: CGFloat = 20
    
    let smallTextIconFontSize: CGFloat = 15
    
    let bottomIconSize: CGFloat = 20
    
    let defaultPadding: CGFloat = 8
    
    let fontSizeBottomIcons: CGFloat = 15
    
    func setNewBio(bio: String) {
        if loaded {
            user?.bio = bio
        }
    }
    
    var isBioEmpty: Bool {
        let userBio = user?.bio ?? ""
        return userBio.isEmpty
    }
    
    var loaded: Bool {
        return user != nil
    }
    
    var pencilButtonOverlaySize: CGFloat {
        return imageSize * 0.35
    }
    
    var pencilIconOverlaySize: CGFloat {
        return imageSize * 0.15
    }
    
    var averageShippingDaysText: String {
        if let averageShippingDays = user?.averageShippingDays {
            return "\(averageShippingDays)"
        } else {
            return "..."
        }
    }
    
    var totalRatingsText: String {
        if let totalRatings = user?.totalRatings {
            return "(\(totalRatings))"
        } else {
            return "..."
        }
    }
    
    var averageRatingsText: String {
        if let averageRating = user?.averageRating {
            return "\(averageRating)"
        } else {
            return "..."
        }
    }
    
    func formatK(_ value: Int) -> String {
        value >= 1000
        ? String(format: "%.1fK", Double(value) / 1000)
        : "\(value)"
    }
    
    var totalFollowersText: String {
        if let followersAmount = user?.followersAmount {
            return formatK(followersAmount)
        } else {
            return "..."
        }
    }
    
    var leaderBoardPositionText: String {
        if let leaderBoardPosition = user?.leaderBoardPosition {
            if leaderBoardPosition > 99 {
                return "+99"
            } else {
                return "\(leaderBoardPosition)"
            }
        } else {
            return "..."
        }
    }
    
    func joinedDateText(date: Date?) -> String {
        if date == nil {
            return "..."
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            formatter.locale = Locale(identifier: "en_US")
            let formatted = formatter.string(from: date!)
            return "Joined \(formatted)"
        }
    }
    
}

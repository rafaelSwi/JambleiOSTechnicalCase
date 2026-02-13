//
//  LivestreamTemplateViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine
import CoreFoundation
import Foundation

@MainActor
final class LivestreamTemplateViewModel: ObservableObject {
    
    @Published var livestream: Livestream
    
    let defaultHeightOverlay: CGFloat = 25
    let defaultCornerRadiusOverlay: CGFloat = 25
    let defaultFontSizeOverlay: CGFloat = 12
    let defaultPaddingOverlay: CGFloat = 10
    
    init(livestream: Livestream) {
        self.livestream = livestream
    }
    
    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
    
}

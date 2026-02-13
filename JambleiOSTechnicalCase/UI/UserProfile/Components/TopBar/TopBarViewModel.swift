//
//  TopBarViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import Combine
import CoreFoundation

@MainActor
final class TopBarViewModel: ObservableObject {
    
    @Published var name: String
    
    let defaultIconButtonSize: CGFloat = 26
    
    init(name: String) {
        self.name = name
    }
    
}

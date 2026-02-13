//
//  ExpandableTextViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import Combine
import CoreFoundation

@MainActor
final class ExpandableTextViewModel: ObservableObject {
    
    @Published var text: String
    
    @Published var expanded: Bool = false
    
    let fontSize: CGFloat = 15
    
    init(text: String) {
        self.text = text
    }
    
    var isTooBig: Bool {
        return text.count > 20
    }
    
    func limit(_ text: String, to max: Int) -> String {
        String(text.prefix(max))
    }
    
}

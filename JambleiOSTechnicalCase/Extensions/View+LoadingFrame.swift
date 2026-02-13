//
//  View+LoadingFrame.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func loadingFrame(width: CGFloat, height: CGFloat, loaded: Bool) -> some View {
        
        if loaded {
            self
                .frame(width: width, height: height)
        } else {
            ProgressView()
                .frame(width: width, height: height)
        }
        
        
    }
    
    
}

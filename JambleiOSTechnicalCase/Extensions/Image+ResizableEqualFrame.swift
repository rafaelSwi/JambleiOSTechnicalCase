//
//  View+ResizableEqualFrame.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

extension Image {
    
    @ViewBuilder
    func resizableEqualFrame(size: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
        
    }
    
}

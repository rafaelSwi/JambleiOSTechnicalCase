//
//  TopBarView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import SwiftUI

struct TopBarView: View {
    
    @ObservedObject var vm: TopBarViewModel
    
    init(name: String) {
        _vm = ObservedObject(wrappedValue: TopBarViewModel(name: name))
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(vm.name)
                    .font(.system(size: 23))
                    .bold()
                    .foregroundStyle(.topBarName)
                
                Spacer()
                
                Button(action: {}) {
                    Image("icon-plus")
                        .resizableEqualFrame(size: vm.defaultIconButtonSize)
                }
                
                Spacer()
                    .frame(width: 10)
                
                NavigationLink(destination: DebugMenuView()) {
                    Image("icon-gear")
                        .resizableEqualFrame(size: vm.defaultIconButtonSize)
                }
                
            }
            .frame(height: 40)
            .padding(.horizontal, 12)
            
            Rectangle()
                .frame(height: 1)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.fadingGray)
            
        }
        
    }
}


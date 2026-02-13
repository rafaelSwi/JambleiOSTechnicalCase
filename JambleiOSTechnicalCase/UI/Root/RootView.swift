//
//  RootView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var vm: RootViewModel
    
    init() {
        _vm = StateObject(wrappedValue: RootViewModel())
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Group {
                if vm.tab == 0 {
                    Text("(live screen)")
                } else if vm.tab == 1 {
                    Text("(rewards screen)")
                } else if vm.tab == 2 {
                    Text("(activities screen)")
                } else if vm.tab == 3 {
                    UserProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            BottomNavigationBarView(selectionIndex: $vm.tab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

//
//  UserProfileView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject private var vm: UserProfileViewModel
    
    init() {
        _vm = StateObject(wrappedValue: UserProfileViewModel(userService: UserService()))
    }

    
    var body: some View {
        
        NavigationStack {
            
            TopBarView(name: vm.user?.name ?? "...")
            
            Group {
                PersonalProfileInfoView(user: vm.user)
            }
            .task {
                await vm.getMainUser()
            }
            
            Spacer()
                .frame(height: 25)
            
            VStack(spacing: 0) {
                HorizontalProfileNavigatorView(selectionIndex: $vm.selection)

                TabView(selection: $vm.selection) {
                    UserLivesView()
                        .tag(0)

                    UserReviewsView()
                        .tag(1)

                    UserBookmarksView()
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .alert(
                "Error",
                isPresented: .constant(vm.errorMessage != nil),
                actions: {
                    Button("Ok", role: .cancel) {
                        vm.errorMessage = nil
                    }
                },
                message: {
                    if let message = vm.errorMessage {
                        Text(message)
                    }
                }
            )
            
            Spacer()
            
        }
        .ignoresSafeArea(edges: .bottom)

    }
}

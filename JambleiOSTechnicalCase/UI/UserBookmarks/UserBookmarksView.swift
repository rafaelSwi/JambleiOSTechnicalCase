//
//  UserBookmarksView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct UserBookmarksView: View {
    
    @StateObject var vm: UserBookmarksViewModel
    
    init() {
        _vm = StateObject(wrappedValue: UserBookmarksViewModel(bookmarks: [], bookmarkService: BookmarkService()))
    }
    
    var body: some View {
        
        
        HStack {
            
            ScrollView {
                
                Group {
                    if vm.nothingToFetch {
                        Text("There is nothing here yet")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.top, 100)
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    
                    let lastId = vm.bookmarkedlivestreams.last?.id
                    
                    ForEach(vm.bookmarkedlivestreams) { livestream in
                        LivestreamTemplateView(livestream: livestream)
                            .onAppear {
                                if livestream.id == lastId {
                                    Task {
                                        await vm.getBookmarkedLivestreams()
                                    }
                                }
                            }
                    }
                    
                }
                
                if !vm.end {
                    if !vm.nothingToFetch {
                        ProgressView()
                    }
                } else {
                    Group {
                        Text("Would you like to") + Text(" Refresh?").bold()
                    }
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .padding(.top, 10)
                    .onTapGesture {
                        vm.refreshAction()
                    }
                        
                }
                
            }
            .refreshable {
                vm.refreshAction()
            }
            .alert(
                "Error",
                isPresented: .constant(vm.errorMessage != nil),
                actions: {
                    Button("Try again", role: .destructive) {
                        vm.refreshAction()
                    }
                    Button("Cancel", role: .cancel) {
                        vm.errorMessage = nil
                    }
                },
                message: {
                    if let message = vm.errorMessage {
                        Text(message)
                    }
                }
            )
            
        }
        .task {
            await vm.getBookmarkedLivestreams()
        }
        
    }
}

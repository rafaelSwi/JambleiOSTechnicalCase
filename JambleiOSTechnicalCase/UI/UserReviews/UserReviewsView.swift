//
//  UserReviewsView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct UserReviewsView: View {
    
    @StateObject var vm: UserReviewsViewModel
    
    init() {
        _vm = StateObject(wrappedValue: UserReviewsViewModel(reviews: [], reviewService: ReviewService()))
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
                
                if vm.reviews.count > 1 {
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 38)
                        
                        VStack {
                            
                            Text(String(format: "%.1f", (vm.userReviewsInfo?.averageScore ?? 0)))
                                .bold()
                                .font(.title)
                            
                            Text("Out of 5")
                                .font(.system(size: 12))
                                .bold()
                            
                        }
                        .frame(minWidth: 100)
                        
                        Spacer()
                        
                        VStack {
                            
                            Text(String(vm.userReviewsInfo?.reviewAmount ?? 0))
                                .bold()
                                .font(.title)
                            
                            Text("Reviews")
                                .font(.system(size: 12))
                                .bold()
                            
                        }
                        .frame(minWidth: 100)
                        
                        Spacer()
                            .frame(width: 38)
                        
                    }
                    .padding(.vertical, 15)
                    
                }
                
                
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 18) {
                    
                    let lastId = vm.reviews.last?.id
                    
                    ForEach(vm.reviews) { review in
                        ReviewTemplateView(review: review)
                            .onAppear {
                                if review.id == lastId {
                                    Task {
                                        await vm.getReviews()
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
            await vm.getUserReviewInfo()
            await vm.getReviews()
        }
    }
}

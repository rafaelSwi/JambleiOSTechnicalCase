//
//  UserLivesView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct UserLivesView: View {

    @StateObject var vm: UserLivesViewModel

    init() {
        _vm = StateObject(
            wrappedValue: UserLivesViewModel(
                livestreams: [],
                livestreamService: LivestreamService()
            )
        )
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
                        
                        Text("Schedule a show and go Live!")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                            .fontWeight(.light)
                        
                        Button(action: {}) {
                            Text("Schedule a Live")
                                .padding()
                                .frame(height: 40)
                                .background(Color("DefaultPurple"))
                                .cornerRadius(25)
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.top, 10)
                        }
                    }
                }

                LazyVGrid(columns: [
                    GridItem(.flexible()), GridItem(.flexible()),
                ]) {

                    let lastId = vm.livestreams.last?.id

                    ForEach(vm.livestreams) { livestream in
                        LivestreamTemplateView(livestream: livestream)
                            .onAppear {
                                if livestream.id == lastId {
                                    Task {
                                        await vm.getLivestreams()
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
                        Text("You've reached a dead end!")
                            + Text(" Refresh?").bold()
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
            await vm.getLivestreams()
        }

    }
}

//
//  PersonalProfileInfoView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct PersonalProfileInfoView: View {
    
    @ObservedObject private var vm: PersonalProfileInfoViewModel
    
    init (user: GenericUser?) {
        _vm = ObservedObject(wrappedValue: PersonalProfileInfoViewModel(user: user))
    }
    
    var body: some View {
        
        VStack {
            
            // profile pic and side texts
            HStack {
                
                VStack {
                    
                    Image(vm.user?.pic ?? "avatar-generic")
                        .resizable()
                        .loadingFrame(width: vm.imageSize, height: vm.imageSize, loaded: vm.loaded)
                        .cornerRadius(50)
                        .overlay(alignment: .bottomTrailing) {
                            Button(action: {}) {
                                ZStack {
                                    
                                    Circle()
                                        .foregroundStyle(.black)
                                        .frame(width: vm.pencilButtonOverlaySize, height: vm.pencilButtonOverlaySize)
                                    
                                    Image(systemName: "pencil")
                                        .resizableEqualFrame(size: vm.pencilIconOverlaySize)
                                        .foregroundStyle(.white)
                                    
                                }
                            }
                            .cornerRadius(50)
                        }
                }
                .padding(.leading, 20)
                
                
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 3) {
                        Image("icon-link")
                            .resizableEqualFrame(size: vm.smallIconSize)
                        
                        Button(action: {}) {
                            if let username = vm.user?.username {
                                Text("@\(username)")
                                    .foregroundStyle(.profileLinkText)
                                    .font(.system(size: vm.smallTextIconFontSize))
                            } else {
                                ProgressView()
                            }
                        }
                    }
                    
                        HStack(spacing: 3) {
                            Image(vm.loaded ? "icon-seller-badge" : "icon-circle")
                                .resizableEqualFrame(size: vm.smallIconSize)
                            
                            Text(vm.loaded ? "Live Seller" : "...")
                                .foregroundStyle(.black)
                                .font(.system(size: vm.smallTextIconFontSize))
                        }
                    
                    HStack(spacing: 3) {
                        Image(vm.loaded ? "icon-calendar" : "icon-circle")
                            .resizableEqualFrame(size: vm.smallIconSize)
                        Text(vm.joinedDateText(date: vm.user?.joined))
                            .foregroundStyle(.joinedDateText)
                            .font(.system(size: vm.smallTextIconFontSize))
                    }
                }
                Spacer()
            }
            .frame(height: vm.imageSize)
            
            Spacer()
                .frame(height: 15)
            
            // bottom icons
            HStack {
                
                HStack {
                    HStack {
                        Image("icon-truck-fast")
                            .resizableEqualFrame(size: vm.bottomIconSize)
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            Text(vm.averageShippingDaysText)
                                .foregroundStyle(.gray)
                                .font(.system(size: vm.fontSizeBottomIcons))
                                .bold()
                            Text("days")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                    .defaultBottomIconsOverlay()
                }
                
                HStack {
                    HStack {
                        Image("icon-star")
                            .resizableEqualFrame(size: vm.bottomIconSize)
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            Text(vm.averageRatingsText)
                                .foregroundStyle(.gray)
                                .font(.system(size: vm.fontSizeBottomIcons))
                                .bold()
                            Text(vm.totalRatingsText)
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                    .defaultBottomIconsOverlay()
                }
                
                HStack {
                    HStack {
                        Image("icon-people")
                            .resizableEqualFrame(size: vm.bottomIconSize)
                        Text(vm.totalFollowersText)
                            .font(.system(size: vm.fontSizeBottomIcons))
                            .foregroundStyle(.gray)
                            .bold()
                    }
                    .defaultBottomIconsOverlay()
                }
                
                HStack {
                    HStack {
                        Image("icon-chart-star")
                            .resizableEqualFrame(size: vm.bottomIconSize)
                        Text(vm.leaderBoardPositionText)
                            .font(.system(size: vm.fontSizeBottomIcons))
                            .foregroundStyle(.gray)
                            .bold()
                    }
                    .defaultBottomIconsOverlay()
                }
                
            }
            
            // bio vstack
            VStack {
                
                if vm.isBioEmpty {
                    TextField(
                        "",
                        text: $vm.bioText,
                        prompt: Text("Add a bio...")
                            .foregroundColor(.blue)
                            .font(.system(size: 14))
                    )
                    .textFieldStyle(.roundedBorder)
                    .padding(vm.defaultPadding)
                    
                    if !vm.bioText.isEmpty {
                        Button("Confirm") {
                            vm.setNewBio(bio: vm.bioText)
                        }
                    }
                    
                } else {
                    ExpandableTextView(text: vm.user?.bio ?? "...")
                        .padding(vm.defaultPadding)
                        .padding(.horizontal, 5)
                }
                
            }
            
            HStack(alignment: .center, spacing: 5) {
                
                Spacer()
                    .frame(width: 10)
                
                Button(action: {}) {
                    Text("Invite · R$15")
                        .padding()
                        .frame(height: 35)
                        .background(Color("DefaultPurple"))
                        .cornerRadius(25)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .bold()
                }
                
                Button(action: {}) {
                    Text("Refer Sellers · R$500")
                        .padding()
                        .frame(height: 35)
                        .background(.black)
                        .font(.footnote)
                        .cornerRadius(25)
                        .foregroundStyle(.white)
                        .bold()
                }
                
                Button(action: {}) {
                    Image("icon-share")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                        .background(.black)
                        .cornerRadius(25)
                        .frame(height: 35)
                }
                
                Spacer()
                
            }
            
            
        }
    }
}

private extension View {
    @ViewBuilder
    func defaultBottomIconsOverlay() -> some View {
        self
            .padding(6)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color("FadingGray"), lineWidth: 1)
            }
    }
}

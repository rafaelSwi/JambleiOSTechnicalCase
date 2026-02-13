//
//  LivestreamTemplateView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct LivestreamTemplateView: View {
    
    @StateObject var vm: LivestreamTemplateViewModel
    
    init(livestream: Livestream) {
        _vm = StateObject(wrappedValue: LivestreamTemplateViewModel(livestream: livestream))
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack {
                
                Image(vm.livestream.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                VStack {
                    HStack {
                        
                        if let peopleWatching = vm.livestream.peopleWatching {
                            if peopleWatching > 0 {
                                Rectangle()
                                    .foregroundStyle(.live)
                                    .frame(width: 75, height: vm.defaultHeightOverlay)
                                    .cornerRadius(vm.defaultCornerRadiusOverlay)
                                    .padding(vm.defaultPaddingOverlay)
                                    .overlay {
                                        Text("Live • \(peopleWatching)")
                                            .foregroundStyle(.white)
                                            .font(.system(size: vm.defaultFontSizeOverlay))
                                            .bold()
                                    }
                            }
                        }
                        
                        if let finishDate = vm.livestream.finishDate {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .overlay(Color.black.opacity(0.12))
                                .frame(width: 70, height: vm.defaultHeightOverlay)
                                .cornerRadius(vm.defaultCornerRadiusOverlay)
                                .padding(vm.defaultPaddingOverlay)
                                .overlay {
                                    Text(vm.formatTime(finishDate))
                                        .foregroundStyle(.white)
                                        .font(.system(size: vm.defaultFontSizeOverlay))
                                        .bold()
                                }
                        }
                        
                        Spacer()
                        
                        if let finishDate = vm.livestream.finishDate {
                            
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .overlay(Color.black.opacity(0.12))
                                .frame(width: 50, height: vm.defaultHeightOverlay)
                                .cornerRadius(vm.defaultCornerRadiusOverlay)
                                .padding(vm.defaultPaddingOverlay)
                                .overlay {
                                    HStack {
                                        Image(vm.livestream.bookmarked ? "icon-heart-red" : "icon-heart-white")
                                            .resizableEqualFrame(size: vm.defaultHeightOverlay - 9)
                                        Text("\(vm.livestream.likeAmount)")
                                            .foregroundStyle(.white)
                                            .font(.system(size: vm.defaultFontSizeOverlay))
                                            .bold()
                                    }
                                }
                            
                            
                        }
                        
                    }
                    Spacer()
                }
                
            }
            Text(vm.livestream.title)
                .font(.system(size: 13))
                .lineLimit(1)
        }
        .frame(width: 190, height: 260)
        
    }
}

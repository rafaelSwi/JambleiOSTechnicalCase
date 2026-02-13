//
//  HorizontalProfileNavigatorView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct HorizontalProfileNavigatorView: View {
    
    @StateObject var vm: HorizontalProfileNavigatorViewModel
    
    @Binding var selection: Int
    
    init(selectionIndex: Binding<Int>) {
        _vm = StateObject(wrappedValue: HorizontalProfileNavigatorViewModel())
        _selection = selectionIndex
    }
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .center, spacing: 0) {
                
                VStack {
                    let isSelected = selection == 0
                    HStack {
                        
                        Image("icon-play")
                            .resizableEqualFrame(size: vm.defaultIconSize)
                        
                        if isSelected {
                            Text("Lives")
                                .font(.system(size: 15))
                                .bold()
                                
                        }
                        
                        
                    }
                    Rectangle()
                        .foregroundStyle(isSelected ? .black : .fadingGray)
                        .frame(maxWidth: .infinity)
                        .frame(height: isSelected ? 3 : 2)
                        .offset(CGSize(width: 0, height: isSelected ? 0 : 1))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selection = 0
                }
                
                VStack {
                    let isSelected = selection == 1
                    HStack {
                        
                        Image("icon-star-dark")
                            .resizableEqualFrame(size: vm.defaultIconSize)
                        
                        if isSelected {
                            Text("Reviews")
                                .font(.system(size: 15))
                                .bold()
                        }
                        
                        
                    }
                    Rectangle()
                        .foregroundStyle(isSelected ? .black : Color("FadingGray"))
                        .frame(maxWidth: .infinity)
                        .frame(height: isSelected ? 3 : 2)
                        .offset(CGSize(width: 0, height: isSelected ? 0 : 1))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selection = 1
                }
                
                VStack {
                    let isSelected = selection == 2
                    HStack {
                        
                        Image("icon-heart-dark")
                            .resizableEqualFrame(size: vm.defaultIconSize)
                        
                        if isSelected {
                            Text("Bookmarks")
                                .font(.system(size: 15))
                                .bold()
                        }
                        
                        
                    }
                    Rectangle()
                        .foregroundStyle(isSelected ? .black : Color("FadingGray"))
                        .frame(maxWidth: .infinity)
                        .frame(height: isSelected ? 3 : 2)
                        .offset(CGSize(width: 0, height: isSelected ? 0 : 1))
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selection = 2
                }
                
                
            }
            
        }
        
        
    }
}

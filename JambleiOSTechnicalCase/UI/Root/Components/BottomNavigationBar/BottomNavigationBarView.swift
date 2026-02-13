//
//  BottomNavigationBarView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import SwiftUI

struct BottomNavigationBarView: View {
    
    @StateObject var vm: BottomNavigationBarViewModel
    
    @Binding var selection: Int
    
    init(selectionIndex: Binding<Int>) {
        _vm = StateObject(wrappedValue: BottomNavigationBarViewModel())
        _selection = selectionIndex
    }
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundStyle(.fadingGray)
                .padding(.bottom, 3)
            
            HStack(alignment: .center) {
                
                Group {
                    let index = 0
                    let isSelected = (selection == index)
                    VStack {
                        Image("icon-home")
                            .renderingMode(.template)
                            .resizableEqualFrame(size: vm.defaultIconSize)
                        
                        Text("Live")
                            .font(.system(size: vm.defaultFontSize))
                    }
                    .foregroundStyle(isSelected ? .black : .tabText)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selection = index
                    }
                }
                
                Group {
                    let index = 1
                    let isSelected = (selection == index)
                    VStack {
                        Image("icon-rewards")
                            .renderingMode(.template)
                            .resizableEqualFrame(size: vm.defaultIconSize)
                        
                        Text("Rewards")
                            .font(.system(size: vm.defaultFontSize))
                    }
                    .foregroundStyle(isSelected ? .black : .tabText)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selection = index
                    }
                }
                
                Group {
                    let index = 2
                    let isSelected = (selection == index)
                    VStack {
                        Image("icon-activity")
                            .renderingMode(.template)
                            .resizableEqualFrame(size: vm.defaultIconSize)
                        
                        Text("Activity")
                            .font(.system(size: vm.defaultFontSize))
                    }
                    .foregroundStyle(isSelected ? .black : .tabText)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selection = index
                    }
                }
                
                Group {
                    let index = 3
                    let isSelected = (selection == index)
                    VStack {
                        Image("avatar-01")
                            .resizableEqualFrame(size: vm.defaultIconSize)
                            .cornerRadius(30)
                        
                        Text("Profile")
                            .font(.system(size: vm.defaultFontSize))
                    }
                    .foregroundStyle(isSelected ? .black : .tabText)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        selection = index
                    }
                }
                

                
            }
            .frame(maxHeight: 40)
            
        }
        .padding(.bottom, 15)
        .background(.white)
        
    }
}

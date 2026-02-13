//
//  ExpandableTextView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 11/02/26.
//

import SwiftUI

struct ExpandableTextView: View {
    
    @StateObject var vm: ExpandableTextViewModel
    
    init(text: String) {
        _vm = StateObject(wrappedValue: ExpandableTextViewModel(text: text))
    }
    
    var body: some View {
        
        if vm.isTooBig {
            
            if vm.expanded {
                Text(vm.text)
                    .lineLimit(6)
                    .onTapGesture {
                        vm.expanded = false
                    }
                    .font(.system(size: vm.fontSize))
            } else {
                Group {
                    Text(vm.limit(vm.text, to: 75)) + Text(" Read more").bold()
                }
                .lineLimit(2)
                .font(.system(size: vm.fontSize))
                .onTapGesture {
                    vm.expanded = true
                }
                    
            }
            
        }
        
    }
}

//
//  ReviewTemplateView.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import SwiftUI

struct ReviewTemplateView: View {
    
    @StateObject var vm: ReviewTemplateViewModel
    
    init(review: Review) {
        _vm = StateObject(wrappedValue: ReviewTemplateViewModel(review: review))
    }
    
    var body: some View {
        
        ZStack {
            
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.05))
                .cornerRadius(10)
                .frame(height: vm.review.description.isEmpty ? 65 : 80)
            
            VStack(spacing: 5) {
                
                HStack {
                    
                    Image(vm.review.pic)
                        .resizableEqualFrame(size: 20)
                        .cornerRadius(15)
                    
                    Text(vm.review.username)
                        .font(.system(size: 13.5))
                        .bold()
                    
                    Spacer()
                    
                    Text(vm.timeAgo(from: vm.review.date))
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                    
                }
                
                HStack(spacing: 0) {
                    ForEach(0..<vm.review.rating, id: \.self) { number in
                            Image("icon-star")
                            .resizableEqualFrame(size: 20)
                    }
                    Spacer()
                }
                
                if !vm.review.description.isEmpty {
                    HStack {
                        Text(vm.review.description)
                            .font(.system(size: 13.5))
                            .fontWeight(.light)
                            .foregroundStyle(.joinedDateText)
                        Spacer()
                    }
                }
                
            }
            .padding(.horizontal, 8)
            
        }
        .frame(maxHeight: 70)
        .padding(.horizontal, 10)
        
    }
}

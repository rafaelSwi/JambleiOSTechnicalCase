//
//  ReviewTemplateViewModel.swift
//  JambleiOSTechnicalCase
//
//  Created by rafael on 12/02/26.
//

import Combine
import Foundation

@MainActor
final class ReviewTemplateViewModel: ObservableObject {
    
    @Published var review: Review
    
    init(review: Review) {
        self.review = review
    }
    
    // IA made this
    func timeAgo(from date: Date) -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .weekOfYear, .day, .hour, .minute, .second], from: date, to: now)

        if let year = components.year, year > 0 {
            return "\(year)y"
        } else if let month = components.month, month > 0 {
            return "\(month)mo"
        } else if let week = components.weekOfYear, week > 0 {
            return "\(week)w"
        } else if let day = components.day, day > 0 {
            return "\(day)d"
        } else if let hour = components.hour, hour > 0 {
            return "\(hour)h"
        } else if let minute = components.minute, minute > 0 {
            return "\(minute)m"
        } else if let second = components.second, second > 0 {
            return "\(second)s"
        } else {
            return "now"
        }
    }
    
}

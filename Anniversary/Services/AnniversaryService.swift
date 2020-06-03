//
//  AnniversaryService.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/6/3.
//  Copyright © 2020 yzqi. All rights reserved.
//

import Foundation
class AnniversaryService {
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    func countdownDays(fromDate: Date) -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        let fromDate = formatter.date(from: formatter.string(from: fromDate)) ?? Date()
        let toDate = formatter.date(from: formatter.string(from: Date()))!
        let days = calendar.dateComponents([.day],
                                           from: fromDate,
                                           to: toDate)
            .day ?? 0
        
        return "\(days)"
    }

}

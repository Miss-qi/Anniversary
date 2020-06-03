//
//  AnniversaryDetail.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryDetail: View {
    var anniversary: AnniversaryData

    var body: some View {
        VStack(alignment: .center) {
            VStack {
                HStack {
                    Text(anniversary.name) + Text(" 已经")
                }
                .frame(height: 50)
                Text(countdownDate)
                    .frame(height: 100)
                    .font(.body)
                HStack {
                    Text("起始日：")
                    Text(startDate)
                }
            }
                .frame(width: 200)
                .padding()
        }
        .padding()
        .frame(maxWidth: 700)
    }
    
    var startDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: anniversary.date)
    }
    
    var countdownDate: String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        let fromDate = formatter.date(from: formatter.string(from: anniversary.date)) ?? Date()
        let toDate = formatter.date(from: formatter.string(from: Date()))!
        let days = calendar.dateComponents([.day],
                                           from: fromDate,
                                           to: toDate)
            .day ?? 0
        
        return "\(days)"
    }
}

struct AnniversaryDetail_Previews: PreviewProvider {
    static var previews: some View {
        let data = AnniversaryData()
        data.name = ""
        data.id = UUID()
        data.tag = "work"
        data.isTop = false

        return AnniversaryDetail(anniversary: data)
    }
}

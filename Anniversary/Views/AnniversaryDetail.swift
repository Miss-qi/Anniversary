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
    var anniversaryService = AnniversaryService()

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
        return anniversaryService.formattedDate(date: anniversary.date)
    }
    
    var countdownDate: String {
        return anniversaryService.countdownDays(fromDate: anniversary.date)
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

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
            Spacer()

            VStack {
                HStack {
                    Spacer()
                    Text(anniversary.name) + Text(" " + description)
                    Spacer()
                }
                .padding()
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .font(.system(size: 15))

                Text(countdownDate)
                    .frame(height: 100)
                    .font(.system(size: 50))

                HStack {
                    Spacer()
                    Text("起始日：" + startDate)
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .foregroundColor(.gray)
                .font(.system(size: 15))
            }
                .frame(width: 250)
                .background(Color.white)

            Spacer()
        }
        .padding()
        .frame(maxWidth: 700)
    }
    
    var description: String {
        return anniversaryService.getDescription(fromDate: anniversary.date)
    }
    
    var startDate: String {
        return anniversaryService.formattedDate(date: anniversary.date)
    }
    
    var countdownDate: String {
        let days = anniversaryService.countdownDays(fromDate: anniversary.date)
        return days.replacingOccurrences(of: "-", with: "")
    }
}

struct AnniversaryDetail_Previews: PreviewProvider {
    static var previews: some View {
        return AnniversaryDetail(anniversary: PreviewService.getPreviewData())
    }
}

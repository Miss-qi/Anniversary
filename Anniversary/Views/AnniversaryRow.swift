//
//  AnniversaryRow.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryRow: View {
    var anniversary: AnniversaryData
    var anniversaryService = AnniversaryService()

    var body: some View {
        HStack(alignment: .center) {
            Text(anniversary.tag)
                .frame(width: 60)

            VStack {
                Text(anniversary.name)
                    .frame(height: 20)
                Text(startDate)
                    .frame(height: 20)
            }
            .frame(width: 80)
            .padding()

            HStack {
                Text(description + " " + countdownDate + " 天")
                Spacer()
            }
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
        .foregroundColor(.white)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(tagColor.opacity(0.6), lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(tagColor.opacity(0.6)))
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

    var tagColor: Color {
        if anniversary.tag == "工作" {
            return .blue
        } else if anniversary.tag == "生活" {
            return .green
        } else if anniversary.tag == "纪念日" {
            return .orange
        }
        return .gray
    }
}

struct AnniversaryRow_Previews: PreviewProvider {
    static var previews: some View {
        return AnniversaryRow(anniversary: PreviewService.getPreviewData())
    }
}


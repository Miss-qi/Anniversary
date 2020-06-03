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

    var body: some View {
        HStack(alignment: .center) {
            Text(anniversary.tag)
                .frame(width: 100)
            
            VStack {
                Text(anniversary.name)
                    .frame(height: 20)
//                Text(anniversary.date)
//                    .frame(height: 20)
            }
            .padding()

            HStack {
                Text("已经过了")
                Text("\(getCountdownDate)")
                Text("天")
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
    
    var getCountdownDate: String {
//        let dateB = DateInRegion("2017-07-23 12:00:00", format: "YYYY-MM-dd", region: rome)!
//        let days = dateA?.getInterval(toDate: dateB, component: .day)
//        if days != nil {
//            return String(days)
//        }
//        return "0"
        
        return "100"
    }

    var tagColor: Color {
        if anniversary.tag == "work" {
            return .blue
        } else if anniversary.tag == "life" {
            return .green
        } else if anniversary.tag == "anniversary" {
            return .orange
        }
        return .gray
    }
}

struct AnniversaryRow_Previews: PreviewProvider {
    static var previews: some View {
        let data = AnniversaryData()
        data.name = "name"
        data.id = UUID()
        data.tag = "work"
        data.isTop = false
        return AnniversaryRow(anniversary: data)
    }
}


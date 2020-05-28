//
//  AnniversaryRow.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryRow: View {
    var anniversary: Anniversay

    var body: some View {
        HStack(alignment: .center) {
            Text(anniversary.name)
                .font(.body)
                .frame(width: 50, alignment: .center)
                .padding()
            Text(anniversary.date)
                .font(.headline)
                .frame(width: 150, alignment: .center)
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
        .foregroundColor(.white)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(tagColor.opacity(0.6), lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(tagColor.opacity(0.6)))
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
        AnniversaryRow(anniversary: anniversaies[0])
    }
}


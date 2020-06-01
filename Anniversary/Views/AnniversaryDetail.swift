//
//  AnniversaryDetail.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryDetail: View {
    var anniversary: Anniversay

    var body: some View {
        VStack(alignment: .center) {
            VStack {
                HStack {
                    Text(anniversary.name) + Text(" 已经")
                }
                .frame(height: 50)
                Text("123")
                    .frame(height: 100)
                    .font(.body)
                HStack {
                    Text("起始日：")
                    Text(anniversary.date)
                }
            }
                .frame(width: 200)
                .padding()
        }
        .padding()
        .frame(maxWidth: 700)
    }
}

struct AnniversaryDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryDetail(anniversary: anniversaries[0])
    }
}

//
//  AnniversaryCreate.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/29.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryCreate: View {
    var tags = ["work", "life", "anniversary"]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var anniversaryDate = Date()
    @State var name: String = "纪念日"
    @State private var selectedTag = "work"


    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            HStack {
                Text("名称")
                TextField("请输入名称", text: $name)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
            }
                .frame(width: 200)

            HStack {
                DatePicker(selection: $anniversaryDate, in: ...Date(), displayedComponents: .date) {
                    Text("日期")
                }
            }
                .frame(width: 200)

            HStack {
                Picker(selection: $selectedTag, label: Text("类型")) {
                   ForEach(0 ..< tags.count) {
                      Text(self.tags[$0])
                   }
                }
            }
                .frame(width: 200)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 700)
    }
}

struct AnniversaryCreate_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryCreate()
    }
}

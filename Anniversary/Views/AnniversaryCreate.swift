//
//  AnniversaryCreate.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/29.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryCreate: View {
    var tags = ["工作", "生活", "纪念日"]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var anniversaryDate = Date()
    @State var name: String = ""
    @State private var selectedTag = "工作"
    @Environment(\.managedObjectContext) var managedObjectContext


    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            HStack {
                Text("名称")
                TextField("请输入名称", text: $name)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.blue)
            }
                .frame(width: 200)

            DatePicker(selection: $anniversaryDate, displayedComponents: .date) {Text("日期")}
                .frame(width: 200)
                .datePickerStyle(FieldDatePickerStyle())

            Picker(selection: $selectedTag, label: Text("类型")) {
                ForEach(tags, id: \.self) { tag in
                  Text(tag)
               }
            }
                .frame(width: 200)

            Button(action: createAnniversary) {
                Text("Submit")
            }
                .frame(width: 200)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 700)
    }

    func createAnniversary() {
        let anniversary = AnniversaryData(context: self.managedObjectContext)
        anniversary.myId = UUID()
        anniversary.name = name
        anniversary.date = anniversaryDate
        anniversary.tag = selectedTag
        anniversary.isTop = false

        do {
            try self.managedObjectContext.save()
            print("Order saved.")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct AnniversaryCreate_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryCreate()
    }
}

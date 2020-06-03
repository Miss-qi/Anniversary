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
    @State private var selectedTag = 0


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

            DatePicker(selection: $anniversaryDate, in: ...Date(), displayedComponents: .date) {Text("日期")}
                 .frame(width: 200)

            Picker(selection: $selectedTag, label: Text("类型")) {
               ForEach(0 ..< tags.count) {
                  Text(self.tags[$0])
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
//        let anniversary = AnniversaryData(context: context)
//        anniversary.id = UUID()
//        anniversary.name = name
//        anniversary.date = anniversaryDate
//        anniversary.tag = tags[selectedTag]
//        anniversary.isTop = false

//         appDelegate.saveContext()
//         print(name, anniversaryDate, tags[selectedTag])
//         do {
//             let data = try context.fetch(AnniversaryData.fetchRequest())
//             print("second data", data)
//         } catch {
//             print("error")
//         }
    }
}

struct AnniversaryCreate_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryCreate()
    }
}

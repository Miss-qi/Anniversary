//
//  AnniversaryList.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryList: View {
    @EnvironmentObject private var anniversaies: Anniversaries
    @Binding var selectedAnniversary: AnniversaryData?
    @Environment(\.managedObjectContext) var managedObjectContext
       
    @FetchRequest(entity: AnniversaryData.entity(),
                 sortDescriptors: [])
   
    var anniversaryData: FetchedResults<AnniversaryData>

    var body: some View {
        return VStack {
            Button("添加" ,action: addItem)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .buttonStyle(BorderlessButtonStyle())

            List(selection: $selectedAnniversary) {
                ForEach(anniversaryData) { anniversary in
                    AnniversaryRow(anniversary: anniversary)
                        .tag(anniversary)
                        .onTapGesture() {
                            self.anniversaies.createAnniversary = false
                            self.selectedAnniversary = anniversary
                        }
                }
            }
        }
    }

    func addItem() {
        self.anniversaies.createAnniversary = true
    }
}

struct AnniversaryList_Previews: PreviewProvider {
    static var previews: some View {
        let data = AnniversaryData()
        data.name = "name"
        data.id = UUID()
        data.tag = "work"
        data.isTop = false

        let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        return AnniversaryList(selectedAnniversary: .constant(data))
                .environment(\.managedObjectContext, context)
                .environmentObject(Anniversaries())
    }
}

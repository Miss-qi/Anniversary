//
//  AnniversaryList.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryList: View {
    @EnvironmentObject private var anniversaies: AnniversaryStore
    @Binding var selectedAnniversary: AnniversaryData?
    @Environment(\.managedObjectContext) var managedObjectContext
    var tags = ["工作", "生活", "纪念日"]
    @State var filter = "工作"

//    var fetchRequest: FetchRequest<AnniversaryData>
//    var data: FetchedResults<AnniversaryData> { fetchRequest.wrappedValue }

    @FetchRequest(entity: AnniversaryData.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \AnniversaryData.date, ascending: false)]) var anniversaryData: FetchedResults<AnniversaryData>

//    init(selectedAnniversary: Binding<AnniversaryData?>, filter) {
//        self._selectedAnniversary = selectedAnniversary
////        _filter = State(initialValue: "工作")
//
//        fetchRequest = FetchRequest<AnniversaryData>(entity: AnniversaryData.entity(), sortDescriptors: [], predicate: NSPredicate(format: "tag == %@", filter))
//
//    }

    var body: some View {
       return VStack {
           HStack {
               CommonButton(buttonText: "添加", handleAction: addItem)
               CommonButton(buttonText: "删除", handleAction: deleteItem)
               Picker(selection: $filter, label: Text("类型")) {
                   ForEach(tags, id: \.self) { color in
                     Text(color)
                  }
               }
           }

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

    func deleteItem() {
        if selectedAnniversary != nil {
            self.anniversaies.createAnniversary = true
            self.managedObjectContext.delete(selectedAnniversary!)
            selectedAnniversary = nil

            do {
                try self.managedObjectContext.save()
                print("Order saved.")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct AnniversaryList_Previews: PreviewProvider {
    static var previews: some View {
        return AnniversaryList(selectedAnniversary: .constant(PreviewService.getPreviewData()))
            .environment(\.managedObjectContext, PreviewService.getContext())
                .environmentObject(AnniversaryStore())
    }
}

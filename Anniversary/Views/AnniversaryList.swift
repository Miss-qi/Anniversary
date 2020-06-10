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

    @FetchRequest(entity: AnniversaryData.entity(),
                 sortDescriptors: [])

    var anniversaryData: FetchedResults<AnniversaryData>

    var body: some View {
        return VStack {
            HStack {
                CommonButton(buttonText: "添加", handleAction: addItem)
                CommonButton(buttonText: "删除", handleAction: deleteItem)
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

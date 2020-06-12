//
//  Operations.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/6/11.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct Operations: View {
    @EnvironmentObject private var anniversaryStore: AnniversaryStore
    @Environment(\.managedObjectContext) var managedObjectContext
    var tags = ["全部", "工作", "生活", "纪念日"]

    var body: some View {
        return HStack {
            CommonButton(buttonText: "添加", handleAction: addItem)
            CommonButton(buttonText: "删除", handleAction: deleteItem)
            Picker(selection: $anniversaryStore.filterTag, label: Text("类型")) {
                    ForEach(tags, id: \.self) { color in
                      Text(color)
                   }
            }
        }
    }
    
    func addItem() {
        self.anniversaryStore.createAnniversary = true
    }

    func deleteItem() {
        if anniversaryStore.selectedAnniversary != nil {
            self.anniversaryStore.createAnniversary = true
            self.managedObjectContext.delete(anniversaryStore.selectedAnniversary!)
            anniversaryStore.selectedAnniversary = nil

            do {
                try self.managedObjectContext.save()
                print("Order saved.")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct Operations_Previews: PreviewProvider {
    static var previews: some View {
        Operations()
        .environment(\.managedObjectContext, PreviewService.getContext())
        .environmentObject(AnniversaryStore())
    }
}

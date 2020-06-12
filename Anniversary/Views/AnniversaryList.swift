//
//  AnniversaryList.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryList: View {
    @EnvironmentObject private var anniversaryStore: AnniversaryStore
    @Environment(\.managedObjectContext) var managedObjectContext

    var fetchRequest: FetchRequest<AnniversaryData>
    var data: FetchedResults<AnniversaryData> { fetchRequest.wrappedValue }

    var body: some View {
       return VStack {

        List(selection: $anniversaryStore.selectedAnniversary) {
                ForEach(data) { anniversary in
                    AnniversaryRow(anniversary: anniversary)
                        .tag(anniversary)
                        .onTapGesture() {
                            self.anniversaryStore.createAnniversary = false
                            self.anniversaryStore.selectedAnniversary = anniversary
                        }
                }
            }
        }
    }
    
    init(filterTag: String) {
        var condition = [""]
        if filterTag == "全部" {
            condition = AnniversaryService.tags
        } else {
            condition = [filterTag]
        }

        fetchRequest = FetchRequest<AnniversaryData>(entity: AnniversaryData.entity(), sortDescriptors: [], predicate: NSPredicate(format: "tag in %@", condition))

    }
}

struct AnniversaryList_Previews: PreviewProvider {
    static var previews: some View {
        return AnniversaryList(filterTag: "工作")
            .environment(\.managedObjectContext, PreviewService.getContext())
                .environmentObject(AnniversaryStore())
    }
}

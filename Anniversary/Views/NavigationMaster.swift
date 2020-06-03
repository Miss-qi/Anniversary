//
//  NavigationMaster.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct NavigationMaster: View {
    @Binding var selectedAnniversary: AnniversaryData?
    var body: some View {
        VStack {
            AnniversaryList(selectedAnniversary: $selectedAnniversary)
                .listStyle(SidebarListStyle())
        }
        .frame(minWidth: 400, maxWidth: 500)
    }
}

struct NavigationMaster_Previews: PreviewProvider {
    static var previews: some View {
        let data = AnniversaryData()
        data.name = ""
        data.id = UUID()
        data.tag = "work"
        data.isTop = false
        
        return NavigationMaster(selectedAnniversary: .constant(data))
            .environmentObject(Anniversaries())
    }
}

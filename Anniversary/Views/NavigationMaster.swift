//
//  NavigationMaster.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct NavigationMaster: View {
    @Binding var selectedAnniversary: Anniversay?
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
        NavigationMaster(selectedAnniversary: .constant(anniversaries[1]))
            .environmentObject(Anniversaries())
    }
}

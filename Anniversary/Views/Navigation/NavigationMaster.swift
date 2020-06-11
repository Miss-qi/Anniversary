//
//  NavigationMaster.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct NavigationMaster: View {
    var body: some View {
        VStack {
            AnniversaryList()
                .listStyle(SidebarListStyle())
        }
        .frame(width: 400)
    }
}

struct NavigationMaster_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationMaster()
            .environment(\.managedObjectContext, PreviewService.getContext())
            .environmentObject(AnniversaryStore())
    }
}

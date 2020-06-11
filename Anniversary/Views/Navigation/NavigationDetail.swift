//
//  NavigationDetail.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct NavigationDetail: View {
    @EnvironmentObject var anniversaryStore: AnniversaryStore

    var body: some View {
        VStack {
            Spacer()
            if anniversaryStore.createAnniversary == true {
                AnniversaryCreate()
            } else if anniversaryStore.selectedAnniversary != nil {
                AnniversaryDetail()
            }
            Spacer()
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationDetail()
        .environmentObject(AnniversaryStore())
    }
}

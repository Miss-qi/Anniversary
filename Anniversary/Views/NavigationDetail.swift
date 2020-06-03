//
//  NavigationDetail.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct NavigationDetail: View {
    @EnvironmentObject var anniversaies: Anniversaries
    var selectedAnniversary: AnniversaryData?

    var body: some View {
        VStack {
            Spacer()
            if anniversaies.createAnniversary == true {
                AnniversaryCreate()
            } else if selectedAnniversary != nil {
                AnniversaryDetail(anniversary: selectedAnniversary!)
            }
            Spacer()
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        let data = AnniversaryData()
        data.name = ""
        data.id = UUID()
        data.tag = "work"
        data.isTop = false
        
        return NavigationDetail(selectedAnniversary: data)
        .environmentObject(Anniversaries())
    }
}

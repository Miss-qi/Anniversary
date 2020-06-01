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
    var selectedAnniversary: Anniversay?

    var body: some View {
        ScrollView {
            if anniversaies.createAnniversary == true {
                AnniversaryCreate()
            } else if selectedAnniversary != nil {
                AnniversaryDetail(anniversary: selectedAnniversary!)
            }
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetail(selectedAnniversary: anniversaries[0])
        .environmentObject(Anniversaries())
    }
}

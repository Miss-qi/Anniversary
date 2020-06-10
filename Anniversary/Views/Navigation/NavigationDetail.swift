//
//  NavigationDetail.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct NavigationDetail: View {
    @EnvironmentObject var anniversaies: AnniversaryStore
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
        return NavigationDetail(selectedAnniversary: PreviewService.getPreviewData())
        .environmentObject(AnniversaryStore())
    }
}

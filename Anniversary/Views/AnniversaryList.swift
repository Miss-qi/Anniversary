//
//  AnniversaryList.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryList: View {
    @EnvironmentObject private var anniversaies: Anniversaries

    var body: some View {
        return List() {
            ForEach(anniversaies.data) {
                anniversary in
                AnniversaryRow(anniversary: anniversary)
            }
        }
    }
}

struct AnniversaryList_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryList()
        .environmentObject(Anniversaries())
    }
}

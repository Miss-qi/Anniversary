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
    var anniversary: Anniversay
    
    var anniversaryIndex: Int {
        anniversaies.data.firstIndex(where: { $0.id == anniversary.id })!
    }

    var body: some View {
        ScrollView {
            AnniversaryDetail(anniversary: anniversary)
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetail(anniversary: anniversaies[0])
        .environmentObject(Anniversaries())
    }
}

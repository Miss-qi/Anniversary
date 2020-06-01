//
//  ContentView.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAnniversary: Anniversay?

    var body: some View {
        NavigationView {
            NavigationMaster(selectedAnniversary: $selectedAnniversary)
            NavigationDetail(selectedAnniversary: selectedAnniversary)
        }
            .frame(minWidth: 700, minHeight: 500)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(Anniversaries())
    }
}

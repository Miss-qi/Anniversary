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
    @State private var createAnniversary: Bool?
    
    var body: some View {
        NavigationView {
            NavigationMaster(selectedAnniversary: $selectedAnniversary, createAnniversary: $createAnniversary)
            
            if createAnniversary == true {
                AnniversaryCreate()
            }
            
            if selectedAnniversary != nil {
                NavigationDetail(anniversary: selectedAnniversary!)
            }
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

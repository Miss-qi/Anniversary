//
//  ContentView.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            NavigationMaster()
            NavigationDetail()
        }
            .frame(minWidth: 700, minHeight: 500)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

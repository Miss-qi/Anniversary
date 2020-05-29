//
//  AnniversaryCreate.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/29.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct AnniversaryCreate: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var wakeUp = Date()
    
    var body: some View {
        ScrollView {
            Text("haha")
        }
        .padding()
        .frame(maxWidth: 700)
    }
}

struct AnniversaryCreate_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryCreate()
    }
}

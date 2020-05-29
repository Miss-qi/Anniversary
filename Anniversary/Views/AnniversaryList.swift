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
    @Binding var selectedAnniversary: Anniversay?
    @Binding var createAnniversary: Bool?

    var body: some View {
        return VStack {
            Button("add item" ,action: addItem)
                .frame(height: 50)
            List(selection: $selectedAnniversary) {
                ForEach(anniversaies.data) {
                    anniversary in
                    AnniversaryRow(anniversary: anniversary).tag(anniversary)
                }
            }
        }
    }
    
    func addItem() {
        createAnniversary = true
    }
}

struct AnniversaryList_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryList(selectedAnniversary: .constant(anniversaies[0]), createAnniversary: .constant(false))
        .environmentObject(Anniversaries())
    }
}

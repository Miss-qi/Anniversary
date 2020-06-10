//
//  CommonButton.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/6/5.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

struct CommonButton: View {
    let buttonText: String
    let handleAction: () -> Void

    var body: some View {
        Button(action: handleAction) {
            Text(buttonText)
            .onHover { inside in
                if inside {
                    NSCursor.pointingHand.push()
                } else {
                    NSCursor.pop()
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: 40)
    }
}

struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        return CommonButton(buttonText: "添加", handleAction: test)
    }
}
func test() {
   print()
}

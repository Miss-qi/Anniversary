//
//  Anniversaries.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI
import Combine

final class AnniversaryStore: ObservableObject {
    @Published var createAnniversary: Bool = false
}

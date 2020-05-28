//
//  Anniversary.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import Foundation

struct Anniversay: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var date: String
    var isTop: Bool
    var tag: String
}

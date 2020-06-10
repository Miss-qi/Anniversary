//
//  Anniversaries.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/5/28.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI
import Combine

final class Anniversaries: ObservableObject {
    @Published var createAnniversary: Bool = false
    
    static func getPreviewData() -> AnniversaryData {
        let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let data = AnniversaryData(context: context)
          data.name = "name"
          data.myId = UUID()
          data.tag = "生活"
          data.isTop = false
          data.date = Date()
        return data;
    }
    
    static func getContext() -> NSManagedObjectContext {
        let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return context
    }
}

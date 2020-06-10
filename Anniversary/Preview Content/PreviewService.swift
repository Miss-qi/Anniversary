//
//  PreviewService.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/6/10.
//  Copyright © 2020 yzqi. All rights reserved.
//

import SwiftUI

class PreviewService {
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

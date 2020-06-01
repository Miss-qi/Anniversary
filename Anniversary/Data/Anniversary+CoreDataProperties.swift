//
//  Anniversary+CoreDataProperties.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/6/1.
//  Copyright © 2020 yzqi. All rights reserved.
//
//

import Foundation
import CoreData


extension Anniversary: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Anniversary> {
        return NSFetchRequest<Anniversary>(entityName: "Anniversary")
    }

    @NSManaged public var id: UUID
    @NSManaged public var tag: String
    @NSManaged public var isTop: Bool
    @NSManaged public var name: String
    @NSManaged public var date: Date
    
    var currentTag: Tag {
        set {tag = newValue.rawValue}
        get {Tag(rawValue: tag) ?? .life}
    }

}


enum Tag: String {
    case life = "Life"
    case work = "Work"
    case anniversary = "Anniversay"
}

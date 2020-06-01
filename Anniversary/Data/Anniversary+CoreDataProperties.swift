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


extension Anniversary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Anniversary> {
        return NSFetchRequest<Anniversary>(entityName: "Anniversary")
    }

    @NSManaged public var id: Int64
    @NSManaged public var tag: String?
    @NSManaged public var isTop: Bool
    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}

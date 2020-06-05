//
//  AnniversaryData+CoreDataProperties.swift
//  Anniversary
//
//  Created by Yanzi Qi  on 2020/6/2.
//  Copyright © 2020 yzqi. All rights reserved.
//
//

import Foundation
import CoreData


extension AnniversaryData: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnniversaryData> {
        return NSFetchRequest<AnniversaryData>(entityName: "AnniversaryData")
    }

    @NSManaged public var myId: UUID
    @NSManaged public var name: String
    @NSManaged public var tag: String
    @NSManaged public var isTop: Bool
    @NSManaged public var date: Date

    var tagText: String {
        set {tag = newValue}
        get {
            switch tag {
            case "work":
                return "工作"
            case "life":
                return "生活"
            case "anniversary":
                return "纪念日"
            default:
                return "纪念日"
            }
        }
    }
}

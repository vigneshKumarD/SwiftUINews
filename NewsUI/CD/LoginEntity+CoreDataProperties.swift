//
//  LoginEntity+CoreDataProperties.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 22/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//
//

import Foundation
import CoreData


extension LoginEntity: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoginEntity> {
        return NSFetchRequest<LoginEntity>(entityName: "LoginEntity")
    }

    @NSManaged public var userName: String
    @NSManaged public var id: UUID
    @NSManaged public var password: String

}

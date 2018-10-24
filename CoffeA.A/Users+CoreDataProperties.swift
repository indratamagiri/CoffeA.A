//
//  Users+CoreDataProperties.swift
//  CoffeA.A
//
//  Created by giri on 24/10/18.
//  Copyright © 2018 giri. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var telp: String?
    @NSManaged public var address: String?
    @NSManaged public var idUser: String?

}

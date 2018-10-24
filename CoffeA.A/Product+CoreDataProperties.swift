//
//  Product+CoreDataProperties.swift
//  CoffeA.A
//
//  Created by giri on 24/10/18.
//  Copyright © 2018 giri. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var nameProduct: String?
    @NSManaged public var qty: Int32
    @NSManaged public var status: Bool
    @NSManaged public var id: String?
    @NSManaged public var idUser: String?

}

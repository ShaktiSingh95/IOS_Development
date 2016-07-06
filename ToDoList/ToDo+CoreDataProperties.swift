//
//  ToDo+CoreDataProperties.swift
//  ToDoList
//
//  Created by Shakti Pratap Singh on 05/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ToDo {

    @NSManaged var task: String?
    @NSManaged var user: String?
    @NSManaged var completionStatus: NSNumber?
    @NSManaged var owner: NSManagedObject?

}

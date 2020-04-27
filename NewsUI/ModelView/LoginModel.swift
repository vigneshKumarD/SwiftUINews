//
//  LoginModel.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 22/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation
import CoreData

class LoginModel {
  
  var managedObjectContext: NSManagedObjectContext!
  
  func authenticateUser(with userName: String, password: String) -> Bool {
    let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginEntity")
    
    do {
      let fetchedEmployees = try managedObjectContext.fetch(employeesFetch) as! [LoginEntity]
      for account in fetchedEmployees {
        if account.userName == userName && account.password == password {
          return true
        }
      }
    } catch {
      fatalError("Failed to fetch employees: \(error)")
    }
    return false
  }
}

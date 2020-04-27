//
//  RegistrationModel.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 21/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation
import Combine
import CoreData


protocol UserCredentials {
  func validateCredentials(_ userName: String, password: String) throws
}

enum CredentialsError: Error {
  case userName
  case password
  
  func description() -> String {
    switch self {
    case .userName:
      return "Username length should be between 2 - 100 characters"
    case .password:
      return "Password length should be between 5 - 10 characters"
    }
  }
}

class RegistrationModel: ObservableObject, UserCredentials {
  
  var managedObjectContext: NSManagedObjectContext!
  
  func validateCredentials(_ userName: String, password: String) throws {
    guard userName.count >= 2 && userName.count <= 100 else { throw CredentialsError.userName }
    guard password.count >= 5 && password.count <= 10 else { throw CredentialsError.password }
    do
    {
      try saveToContext(userName, password: password)
    } catch {
       throw error
    }
  }
  
  private func saveToContext(_ userName: String, password: String) throws {
    let user = LoginEntity(context: managedObjectContext)
    user.userName = userName
    user.password = password
    user.id = UUID()
    do {
      try self.managedObjectContext.save()
      print("Order saved.")
    } catch {
      print(error.localizedDescription)
    }
  }
  
}

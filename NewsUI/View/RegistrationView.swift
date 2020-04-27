//
//  RegistrationView.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 21/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI
import Combine

struct RegistrationView: View {
  @State private var userName: String = ""
  @State private var password: String = ""
  @State private var confirmPassword: String = ""
  @State private var showAlert: Bool = false
  
  @State private var errorMessage: String = "Error"
  
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.managedObjectContext) var managedObjectContext
 
   private var alert: Alert {
    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("ok")))
   }
  
  var registrationModel: RegistrationModel = RegistrationModel()

  
  private var isDisabled: Bool { userName.isEmpty || password != confirmPassword }
  
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
          registrationUIContext()
         .textFieldStyle(RoundedBorderTextFieldStyle()).padding().frame(height: 60)
      }.alert(isPresented: $showAlert, content: { self.alert })
    }
  }
  
  func registrationUIContext() -> some View {
    VStack(alignment: .center, spacing: 30) {
      Text("Registration").fontWeight(.bold).foregroundColor(.secondary)
      Spacer()
      
      Group {
        TextField("Username", text: $userName)
        SecureField("Password", text: $password)
        SecureField("Confirm password", text: $confirmPassword,onCommit: {
          print("on commit")
        })
        
        Button(action: {
          self.signupCredentials(self.userName, password: self.password)
          
        }, label: {
          Text("Sign up").fontWeight(.medium).frame(height: 30).padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
            .background(isDisabled ? Color.red.opacity(0.8) : Color.red)
            .cornerRadius(10.0)
            .foregroundColor(isDisabled ? Color.gray : Color.black)
        }).disabled(isDisabled)
      }
    }
  }
  
  func signupCredentials(_ username: String, password: String) {
    registrationModel.managedObjectContext = self.managedObjectContext
    do {
      try registrationModel.validateCredentials(username, password: password)
      self.presentationMode.wrappedValue.dismiss()
    } catch CredentialsError.userName {
      errorMessage = CredentialsError.userName.description()
      showAlert = true
    } catch CredentialsError.password {
      errorMessage = CredentialsError.password.description()
      showAlert = true
    } catch {
      showAlert = true
      print(error)
    }
  }
}

struct RegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationView()
  }
}

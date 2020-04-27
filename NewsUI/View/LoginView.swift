//
//  LoginView.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 22/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  
  @State var userName: String = ""
  @State var password: String = ""
  @State var isLoginSuccess: Bool = false
  @State var isRegisterSuccess: Bool = false
  
  @Environment(\.managedObjectContext) var managedObjectContext
  var loginModel = LoginModel()
  
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
        
        VStack(alignment: .center, spacing: 12) {
          Text("BBC").fontWeight(.bold)
          Spacer()
          TextField("username", text: $userName)
          SecureField("password", text: $password)
          Spacer()
          Button(action: {
          //  self.isLoginSuccess = true
            self.loginModel.managedObjectContext = self.managedObjectContext
            self.isLoginSuccess = self.loginModel.authenticateUser(with: self.userName, password: self.password)
          }, label: {
            Text("Login").fontWeight(.medium).frame(height: 30).padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
              .background(Color.red)
              .cornerRadius(10.0)
              .foregroundColor(Color.black)
          })
          Spacer()
          Button(action: {
            self.isRegisterSuccess = true
          }, label: {
            VStack {
              Text("or").font(.system(size: 12.0))
              Text("Sign up").underline().fontWeight(.medium)
            }
          })
          NavigationLink(destination: NewsListView(), isActive: $isLoginSuccess) {
            EmptyView()
          }
        }.textFieldStyle(RoundedBorderTextFieldStyle()).padding().frame(height: 60)
        
      }
    }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
      .sheet(isPresented: $isRegisterSuccess) {
        RegistrationView(registrationModel: RegistrationModel()).environment(\.managedObjectContext, self.managedObjectContext)
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}

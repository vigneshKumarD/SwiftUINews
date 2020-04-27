//
//  ContentView.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 16/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI

enum NavigationScreen {
  case login
  case register
  case home
  
}
struct ContentView: View {
  
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.imageCache) var cache: ImageCache
  
  var isUserRegistered: NavigationScreen {
    return .login
  }
  
  
  var body: some View {
    containedView()
  }
  
  func containedView() -> AnyView? {
    switch isUserRegistered {
    case .login, .register:
      return AnyView(LoginView())
    case .home:
      return AnyView(NewsListView())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

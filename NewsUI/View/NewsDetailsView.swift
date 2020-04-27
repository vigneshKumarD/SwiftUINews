//
//  NewsDetailsView.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 18/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI

struct NewsDetailsView: View {
  
  @State private var isShown: Bool = false
  @State var article: Article
  @Environment(\.imageCache) var cache: ImageCache
  
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
      VStack {
        ScrollView {
          VStack {
            AsyncImage(
              url: URL(string: article.urlToImage!)!,
              cache: self.cache,
              placeholder: Text("Loading ..."),
              configuration: { $0.resizable() }
            ).frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 300)
              .cornerRadius(5.0)
            VStack {
              Spacer()
              Text(article.title ?? "").fontWeight(.semibold)
              Spacer()
              Text(article.articleDescription ?? "")
              Spacer()
              Text(article.content ?? "")
            }.padding()
          }
        }
        
        HStack {
          Text(article.author ?? "").fontWeight(.light).lineLimit(2)
          Spacer(minLength: 8.0)
          article.publishDate.map { Text($0).fontWeight(.ultraLight)}
        }.padding()
      }
    }
  }
}

struct NewsDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    NewsDetailsView(article: Article())
  }
}

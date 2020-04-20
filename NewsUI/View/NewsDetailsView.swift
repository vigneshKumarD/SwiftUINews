//
//  NewsDetailsView.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 18/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI

struct NewsDetailsView: View {
  
  @State var article: Article
  
    var body: some View {
      
        VStack {
          ScrollView {
            VStack {
              Image("banner").resizable().frame(minWidth: 10, maxWidth: .infinity, minHeight: 200, maxHeight: 320)
              Spacer()
              Text(article.content ?? "").bold().padding()
              Spacer()
              Text(article.articleDescription ?? "")
            }
          }
        
        HStack {
          Text("7 hours ago").fontWeight(.ultraLight).padding()
          Spacer()
          Text(article.author ?? "").fontWeight(.light).padding()
        }
      }
    }
}


struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      NewsDetailsView(article: Article())
    }
}



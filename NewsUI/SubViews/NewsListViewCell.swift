//
//  NewsListViewCell.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 18/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI

struct NewsListViewCell: View {
  
  @State var article: Article
  
    var body: some View {
         VStack(alignment: .leading) {
          Text(article.title ?? "title").bold().lineLimit(3)
                   Spacer()
          HStack(alignment: .bottom, spacing: 5.0) {
                    Text(article.author ?? "").font(.system(size: 12.0)).frame(alignment: .leading)
                     Spacer()
            Text(article.publishDate ?? "").font(.system(size: 10.0)).frame(alignment: .trailing)
                   }
          }.padding()
           .background(Color.white)
           .cornerRadius(10)
  }
}

struct NewsListViewCell_Previews: PreviewProvider {
    static var previews: some View {
      NewsListViewCell(article:Article()).fixedSize()
  }
}

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
          Text(article.source?.name ?? "").bold().lineLimit(3)
                   Spacer()
                   HStack {
                    Text(article.author ?? "").frame(alignment: .leading)
                     Spacer()
                    Text(article.publishedAt ?? "").frame(alignment: .trailing)
                   }
          }
    }
}

struct NewsListViewCell_Previews: PreviewProvider {
    static var previews: some View {
      NewsListViewCell(article:Article())
    }
}

//
//  ListView.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 16/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import SwiftUI
import Combine

///=======================

struct News: Identifiable {
  var id = UUID()
  var name = String()
  var headlines = String()
  var description = String()
}

  let newsData: [News] = [
  News(name: "James ",headlines: "WSJ: President plans to take credit for success, assign blame for failure",description: "WSJ: President plans to take credit for success, assign blame for failure... (Top headline, 7th story, link ) Related stories: Coronavirus began months EARLIER and NOT in Wuhan, bombshell UK report claims... More widespread than realized -- Stanford study... …"),
  News(name: "Modi ",headlines: "WSJ: President plans to take credit for success, assign blame for failure",description: "WSJ: President plans to take credit for success, assign blame for failure... (Top headline, 7th story, link ) Related stories: Coronavirus began months EARLIER and NOT in Wuhan, bombshell UK report claims... More widespread than realized -- Stanford study... …"),
  News(name: "Lodi")]
  /// ======================
  

struct NewsListView: View {
 
  @ObservedObject private var newsModel = NewsModel()

    var body: some View {
      NavigationView {
        List(newsModel.newsData.articles) { news in
          ZStack {
            NewsListViewCell(article: news)
            NavigationLink(destination: NewsDetailsView(article: news)) {
                EmptyView()
              }.buttonStyle(PlainButtonStyle())
          }
      }.padding(.top).navigationBarTitle("BBC", displayMode: .inline)
      }
  }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

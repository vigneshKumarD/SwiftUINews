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
  
  @ObservedObject private var newsModel: NewsModel
  
  init() {
    UITableView.appearance().separatorColor = .clear
    UITableView.appearance().backgroundColor = .clear
    UITableViewCell.appearance().backgroundColor = .clear
    newsModel = NewsModel()
  }
  
  var body: some View {
    
    ZStack {
      LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
      VStack {
        List(newsModel.newsData.articles) { news in
          ZStack {
            NewsListViewCell(article: news)
            NavigationLink(destination: NewsDetailsView(article: news)) {
              EmptyView()
            }.buttonStyle(PlainButtonStyle())
          }.background(Color.clear).listRowBackground(Color.yellow)
            .shadow(color: .gray,radius: 3.0)
        }
        .navigationBarBackButtonHidden(true).navigationBarTitle("BBC", displayMode: .inline)
          .environment(\.defaultMinListRowHeight, 50)
      }
    }
  }
}

struct NewsListView_Previews: PreviewProvider {
  static var previews: some View {
    NewsListView()
  }
}

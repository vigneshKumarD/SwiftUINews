//
//  NewsModel.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 16/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation
import Combine

class NewsModel: ObservableObject {

  @Published var newsData = Welcome()
  var cancellable: AnyCancellable?
  
  init() {
    _ = getNews()
  }
  
  func getNews() {
   cancellable = APIClient.fetchAPI()
    .sink(receiveCompletion: { completion in
      switch completion {
      case .failure(let error):
        print(error)
      case .finished:
        print(completion)
      }
    }, receiveValue: { articles in
      print(articles)
      self.newsData = articles
    })
  }
}

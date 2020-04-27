//
//  NewsResponseModel.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 17/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation

let EmptyString = ""

// MARK: - Welcome
class Welcome: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
  
  init() {
    self.status = EmptyString
    self.totalResults = 0
    self.articles = []
  }
  
}

// MARK: - Article
class Article: NSObject, Codable, Identifiable {
    let id = UUID()
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    var publishDate: String? {
      return publishedAt?.convertToDate()
    }
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
  
  override init() {
    self.source = Source()
    self.author = EmptyString
    self.title = EmptyString
    self.articleDescription = EmptyString
    self.url = EmptyString
    self.urlToImage = EmptyString
    self.publishedAt = EmptyString
    self.content = EmptyString
  }
}

// MARK: - Source
struct Source: Codable {
  var id: String?
  var name: String?
  
  init() {
    self.id = EmptyString
    self.name = EmptyString
  }
}



//
//  NewsResponseModel.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 17/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation

let defaultText: String = "N/A"
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
    //var publishDate: Date? {return self.publishedAt.toDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")}
    self.content = EmptyString
  }
  
//  required init(from decoder: Decoder) throws {
//
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.author = try container.decodeIfPresent(String.self, forKey: .author) ?? ""
//      self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
//      self.articleDescription = try container.decodeIfPresent(String.self, forKey: .articleDescription) ?? ""
//      self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
//      self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
//      self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
//      self.content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
//      self.source = try container.decodeIfPresent(Source.self, forKey: .source) ?? Source()
//  }
//
//  func encode(to encoder: Encoder) throws {
//
//      var container = encoder.container(keyedBy: CodingKeys.self)
//      try container.encode(author, forKey: .author)
//      try container.encode(title, forKey: .title)
//      try container.encode(articleDescription, forKey: .articleDescription)
//      try container.encode(url, forKey: .url)
//      try container.encode(urlToImage, forKey: .urlToImage)
//      try container.encode(publishedAt, forKey: .publishedAt)
//      try container.encode(content, forKey: .content)
//      try container.encode(source, forKey: .source)
//    
//  }
  
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

extension String {
func toDate(dateFormat: String, timeZone: TimeZone = TimeZone.current) -> Date? {
       let frmtr = DateFormatter()
       frmtr.locale = Locale(identifier: "en_US_POSIX")
       frmtr.dateFormat = dateFormat
       frmtr.timeZone = timeZone
       return frmtr.date(from: self)
   }
}

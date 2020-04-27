//
//  APIClient.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 16/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation
import Combine

enum APIEndPoints {
  static let URL = "https://newsapi.org/v2/top-headlines?country=in&apiKey=b32e1344cda64cf09709a072ed11cf37"
}
enum ArticlesError: Error {
  case invalidData
}

public class APIClient: ObservableObject {
  
  static let shared = APIClient()
  
  @Published var article: Welcome!
  
  func load()  {
//    guard let url = URL(string: APIEndPoints.URL) else { return }
//      URLSession.shared.dataTask(with: url) { (data, response, error) in
//          do {
//              guard let data = data else { return }
//              let todos = try JSONDecoder().decode(Welcome.self, from: data)
//              DispatchQueue.main.async {
//              self.article = todos
//              }
//          } catch {
//              print("Failed To decode: ", error)
//          }
//      }.resume()
  }
  
 static func fetchAPI() -> AnyPublisher<Welcome,Error> {
    URLSession.shared.dataTaskPublisher(for: URL(string: APIEndPoints.URL)!)
      .map { $0.data }
        .print()
        .decode(type: Welcome.self,
                decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
     }
  }


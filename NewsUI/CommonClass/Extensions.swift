//
//  Extensions.swift
//  NewsUI
//
//  Created by Vignesh Kumar on 24/04/20.
//  Copyright © 2020 Publicis Sapient. All rights reserved.
//

import Foundation

extension String {
 public func convertToDate(with dateStyle: DateFormatter.Style = .short,
                     timeStyle: DateFormatter.Style = .short) -> String? {
    let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    guard let date = dateFormatter.date(from: self) else { return "" }
       dateFormatter.timeStyle = timeStyle
       //dateFormatter.dateStyle = dateStyle
       return  dateFormatter.string(from: date)
  }
}

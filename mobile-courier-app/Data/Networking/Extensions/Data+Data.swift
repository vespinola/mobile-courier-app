//
//  Data+Data.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import Foundation

extension Data {
  var prettyPrintedJSONString: String? {
    do {
      let jsonObject = try JSONSerialization.jsonObject(with: self, options: [])
      let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
      return String(data: prettyData, encoding: .utf8)
    } catch {
      return nil
    }
  }
}

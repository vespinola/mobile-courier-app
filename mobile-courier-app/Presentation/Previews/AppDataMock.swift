//
//  AppDataMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-23.
//

import Foundation

extension AppData {
  static var mock: AppData {
    let data = AppData()
    data.username = "John Doe"
    return data
  }
}

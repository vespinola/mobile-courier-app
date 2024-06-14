//
//  AppData.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

final class AppData: ObservableObject {
  var token: String?
  @Published var username: String?

  static var shared: AppData = .init()

  func setUsername(_ newUsername: String?) {
    DispatchQueue.main.async { [weak self] in
      self?.username = newUsername
    }
  }

  func updateToken(_ newToken: String?) {
    token = newToken
  }

  func getToken() -> String? {
    token
  }
}

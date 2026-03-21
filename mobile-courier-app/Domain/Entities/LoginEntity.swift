//
//  LoginEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-20.
//

import Foundation

public struct LoginEntity: Codable {
  var username: String
  var accessToken: String

  public init(username: String, accessToken: String) {
    self.username = username
    self.accessToken = accessToken
  }
}

//
//  AuthData.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-29.
//

import Foundation

final class AuthData {
  static var shared: AuthData = .init()
  var loginData: LoginEntity?

  private init() {}
}

//
//  LoginModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-20.
//

import Foundation

struct LoginModel: Decodable {
  var username: String
  var accessToken: String

}

extension LoginModel {
  func asEntity() -> LoginEntity {
    .init(username: username, accessToken: accessToken)
  }
}

//
//  AuthEndpoints.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-06.
//

import Foundation

enum AuthEndpoints {
  case login(email: String, password: String)
  case logout
}

extension AuthEndpoints: Endpoint {

  var mockFile: String? {
    "Login"
  }

  var requestType: RequestType {
    switch self {
    case .login(email: _, password: _):
      return .post
    default:
      return .get
    }
  }

  var path: String {
    switch self {
    case .login(email: _, password: _):
      return "/frontliner-middleware/api/ingresar"
    default:
      return ""
    }
  }

  var body: [AnyHashable: Any]? {
    switch self {
    case .login(email: let email, password: let pass):
      return [
        "username": email,
        "password": pass
      ]
    default:
      return nil
    }
  }

  var queryParams: [String: String]? {
    nil
  }

  var authToken: String? {
    nil
  }
}

//
//  AuthRepositoryProtocol.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-06.
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

struct LoginEntity: Codable {
  var username: String
  var accessToken: String
}

protocol AuthRepositoryProtocol {
  func performLogin(email: String, password: String) async throws -> LoginEntity
}

struct AuthRepository: AuthRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol

  init(apiRequestClient: APIRequestClientProtocol) {
    self.apiRequestClient = apiRequestClient
  }

  func performLogin(email: String, password: String) async throws -> LoginEntity {
    let model: LoginModel = try await apiRequestClient.performRequest(
      endpoint: AuthEndpoints.login(email: email, password: password),
      decoder: JSONDecoder()
    )

    return model.asEntity()
  }
}

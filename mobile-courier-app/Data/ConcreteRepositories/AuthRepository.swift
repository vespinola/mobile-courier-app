//
//  AuthRepository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-20.
//

import Foundation

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

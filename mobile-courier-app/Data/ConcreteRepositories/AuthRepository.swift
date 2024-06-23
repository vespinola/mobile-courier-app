//
//  AuthRepository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-20.
//

import Foundation

struct AuthRepository: AuthRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol

  init(apiRequestClient: APIRequestClientProtocol = APIRequestClient()) {
    self.apiRequestClient = apiRequestClient
  }

  func performLogin(email: String, password: String) async throws {
    let model: LoginModel = try await apiRequestClient.performRequest(
      endpoint: AuthEndpoints.login(email: email, password: password),
      decoder: JSONDecoder()
    )
    AppData.shared.updateToken(model.accessToken)
  }
}

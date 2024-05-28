//
//  AuthRepositoryMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import Foundation

final class AuthRepositoryMock: AuthRepositoryProtocol {
  func performLogin(email: String, password: String) async throws -> LoginEntity {
    .init(username: "Openwindow", accessToken: "accesstoken")
  }
}

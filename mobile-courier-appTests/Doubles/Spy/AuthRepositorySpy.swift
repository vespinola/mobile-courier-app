//
//  AuthRepositorySpy.swift
//  mobile-courier-appTests
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import Foundation
@testable import JustACourierAppDomain

final class AuthRepositorySpy: AuthRepositoryProtocol {
  private(set) var performLoginCalled: Bool = false

  func performLogin(email: String, password: String) async throws {
    performLoginCalled = true
  }
}

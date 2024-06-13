//
//  AuthRepositorySpy.swift
//  mobile-courier-appTests
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import Foundation
@testable import mobile_courier_app

final class AuthRepositorySpy: AuthRepositoryProtocol {
  private(set) var performLoginCalled: Bool = false

  func performLogin(email: String, password: String) async throws {
    performLoginCalled = true
  }
}

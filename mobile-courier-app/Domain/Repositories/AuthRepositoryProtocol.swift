//
//  AuthRepositoryProtocol.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-06.
//

import Foundation

public protocol AuthRepositoryProtocol {
  func performLogin(email: String, password: String) async throws
  func performLogout()
}

public extension AuthRepositoryProtocol {
  func performLogout() { }
}

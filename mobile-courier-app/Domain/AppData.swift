//
//  AppData.swift
//
//
//  Created by Vladimir Espinola on 2024-07-09.
//

import Foundation

public final class AppData: ObservableObject {
  var token: String?
  @Published public var username: String?

  public static var shared: AppData = .init()

  public init() { }

  public func setUsername(_ newUsername: String?) {
    DispatchQueue.main.async { [weak self] in
      self?.username = newUsername
    }
  }

  public func updateToken(_ newToken: String?) {
    token = newToken
  }

  public func getToken() -> String? {
    token
  }
}

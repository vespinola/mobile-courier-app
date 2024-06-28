//
//  AccessibilityIdentifiers.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-27.
//

import Foundation

enum AccessibilityIdentifiers {
  enum Login {
    static var emailTextField: String { "Login-Email" }
    static var passwordTextField: String { "Login-Password" }
    static var loginButton: String { "Login-Button" }
  }

  enum Home {
    static var homeTab: String { "Home-HomeTab" }
    static var withdrawnTab: String { "Home-WithdrawnTab" }
    static var profileTab: String { "Home-ProfileTab" }
    static var settingsTab: String { "Home-SettingsTab" }
  }

  enum HeaderView {
    static var usernameLabel: String { "HeaderView-UsernameLabel" }
  }

  enum GroupedPackageRowView {
    static func get(identifier: String) -> String {
      "GroupedPackageRowView-\(identifier)"
    }
  }
}

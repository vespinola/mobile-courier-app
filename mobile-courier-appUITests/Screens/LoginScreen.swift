//
//  LoginScreen.swift
//  mobile-courier-appUITests
//
//  Created by Vladimir Espinola on 2024-06-27.
//

import XCTest

struct LoginScreen: Screen {
  private init() {}

  @discardableResult
  static func performLogin(email: String, password: String) -> Self.Type {
    sleep(2)
    emailTextField.fillTextField(email)
    passwordTextField.fillTextField(password)
    loginButton.tapOnElement()
    return self
  }
}

private extension LoginScreen {
  static var loginButton: XCUIElement {    app.buttons["Login-Button"]
  }

  static var emailTextField: XCUIElement {
    app.descendants(matching: .any)["Login-Email"]
  }

  static var passwordTextField: XCUIElement {
    app.descendants(matching: .any)["Login-Password"]
  }
}

//
//  MobileCourierAppUITests.swift
//  mobile-courier-appUITests
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import XCTest

final class MobileCourierAppUITests: XCTestCase {
  private var app: XCUIApplication { .init() }

  override func setUp() {
    super.setUp()
    continueAfterFailure = false
  }

  override func tearDown() {
    super.tearDown()
    app.terminate()
    deleteApp()
  }

  func testLogin_givenUserData_whenAuthenticate_shouldLandOnHome() throws {
    app.launch()

    LoginScreen
      .performLogin(email: "john.doe@mail.com", password: "123ABC123")

    HomeScreen
      .verifyUsername()
      .verifyShipment(by: 2179)
      .verifyShipment(by: 2182)
  }
}

extension MobileCourierAppUITests {
  func deleteApp() {
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    let icon = springboard.icons["JustACourierApp"]

    guard icon.elementExists() else { return }

    icon.press(forDuration: 1)

    springboard.buttons["Remove App"].tapOnElement()
    springboard.buttons["Delete App"].tapOnElement()
    springboard.buttons["Delete"].tapOnElement()
  }
}

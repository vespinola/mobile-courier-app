//
//  MobileCourierAppUITests.swift
//  mobile-courier-appUITests
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import XCTest

final class MobileCourierAppUITests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    deleteApp()
    try super.tearDownWithError()
  }

  func testLogin_givenUserData_whenAuthenticate_shouldLandOnHome() throws {
    let app = XCUIApplication()
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

    guard icon.exists else { return }

    icon.press(forDuration: 1)

    springboard.buttons["Remove App"].tapOnElement()
    springboard.buttons["Delete App"].tapOnElement()
    springboard.buttons["Delete"].tapOnElement()
  }
}

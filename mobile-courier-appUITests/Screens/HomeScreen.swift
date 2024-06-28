//
//  HomeScreen.swift
//  mobile-courier-appUITests
//
//  Created by Vladimir Espinola on 2024-06-27.
//

import XCTest

struct HomeScreen: Screen {
  private init() {}

  @discardableResult
  static func verifyUsername() -> Self.Type {
    XCTAssertTrue(headerText.elementExists())
    return self
  }

  @discardableResult
  static func verifyShipment(by id: Int) -> Self.Type {
    XCTAssertTrue(app.staticTexts["GroupedPackageRowView-\(id)"].elementExists())
    return self
  }
}

private extension HomeScreen {
  static var headerText: XCUIElement {
    app.staticTexts["HeaderView-UsernameLabel"]
  }
}

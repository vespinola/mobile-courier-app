//
//  XCUIElement+Extensions.swift
//  mobile-courier-appUITests
//
//  Created by Vladimir Espinola on 2024-06-27.
//

import XCTest

enum Timeout {
  static var `default`: TimeInterval { 10 }
  static var max: TimeInterval { 15 }
}

extension XCUIElement {
  func tapOnElement(timeout: TimeInterval = Timeout.default) {
    guard elementExists(timeout: timeout) else {
      XCTFail("\(description) does not exists")
      return
    }
    tap()
  }

  func elementExists(timeout: TimeInterval = Timeout.default) -> Bool {
    waitForExistence(timeout: timeout)
  }

  func fillTextField(_ text: String) {
    guard elementExists() else {
      XCTFail("\(description) does not exists")
      return
    }

    typeText(text)
  }
}

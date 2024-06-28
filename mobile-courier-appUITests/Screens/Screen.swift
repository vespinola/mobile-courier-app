//
//  Screen.swift
//  mobile-courier-appUITests
//
//  Created by Vladimir Espinola on 2024-06-27.
//

import XCTest

protocol Screen { }

extension Screen {
  static var app: XCUIApplication {
    .init()
  }
}

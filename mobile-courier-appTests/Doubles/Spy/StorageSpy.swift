//
//  StorageSpy.swift
//  mobile-courier-appTests
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import Foundation
@testable import mobile_courier_app

final class StorageSpy: Storage {
  private(set) var getBoolCalled = false
  private(set) var setBoolCalled = false
  private(set) var getStringCalled = false
  private(set) var setStringCalled = false
  private(set) var deleteCalled = false


  func getBool(forKey key: String) -> Bool {
    getBoolCalled = true
    return false
  }
  
  func setBool(_ value: Bool, forKey key: String) {
    setBoolCalled = true
  }
  
  func getString(forKey key: String) -> String? {
    getStringCalled = true
    return ""
  }
  
  func setString(_ value: String, forKey key: String) {
    setStringCalled = true
  }
  
  func delete(forKey: String) {
    deleteCalled = true
  }
}

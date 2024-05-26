//
//  Storage.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-06.
//

import Foundation

protocol Storage {
  func getBool(forKey key: String) -> Bool
  func setBool(_ value: Bool, forKey key: String)
  func getString(forKey key: String) -> String?
  func setString(_ value: String, forKey key: String)

  func delete(forKey: String)
}

final class UserDefaultsStorage: Storage {
  func getString(forKey key: String) -> String? {
    UserDefaults.standard.string(forKey: key)
  }
  
  func setString(_ value: String, forKey key: String) {
    UserDefaults.standard.setValue(value, forKey: key)
  }
  
  func getBool(forKey key: String) -> Bool {
    UserDefaults.standard.bool(forKey: key)
  }

  func setBool(_ value: Bool, forKey key: String) {
    UserDefaults.standard.set(value, forKey: key)
  }

  func delete(forKey: String) {
    UserDefaults.standard.removeObject(forKey: forKey)
  }
}

//
//  StorageMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import Foundation

final class StorageMock: Storage {
  func getBool(forKey key: String) -> Bool { false }

  func setBool(_ value: Bool, forKey key: String) { }

  func getString(forKey key: String) -> String? { "" }

  func setString(_ value: String, forKey key: String) { }

  func delete(forKey: String) { }
}

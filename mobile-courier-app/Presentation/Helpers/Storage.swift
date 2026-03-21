//
//  Storage.swift
//  
//
//  Created by Vladimir Espinola on 2024-07-09.
//

import Foundation

public protocol Storage {
  func getBool(forKey key: String) -> Bool
  func setBool(_ value: Bool, forKey key: String)
  func getString(forKey key: String) -> String?
  func setString(_ value: String, forKey key: String)

  func delete(forKey: String)
}

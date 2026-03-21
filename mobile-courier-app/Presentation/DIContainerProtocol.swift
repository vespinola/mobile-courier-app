//
//  DIContainerProtocol.swift
//
//
//  Created by Vladimir Espinola on 2024-07-09.
//

import Foundation

public protocol DIContainerProtocol {
  func register<T>(_ service: T, for type: T.Type)
  func resolve<T>(_ type: T.Type) -> T
}

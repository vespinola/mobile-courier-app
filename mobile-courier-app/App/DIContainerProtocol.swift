//
//  DIContainerProtocol.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-21.
//

import Foundation

protocol DIContainerProtocol {
  func register<T>(_ service: T, for type: T.Type)
  func resolve<T>(_ type: T.Type) -> T
}

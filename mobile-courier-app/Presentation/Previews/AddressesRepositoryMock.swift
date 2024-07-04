//
//  AddressesRepositoryMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-07.
//

import Foundation
import JustACourierAppDomain

struct AddressesRepositoryMock: AddressRepositoryProtocol {
  func getAddress() async throws -> AddressesEntity {
    .mock
  }
}

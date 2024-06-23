//
//  AddressesRepositoryMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-07.
//

import Foundation

struct AddressesRepositoryMock: AddressRepositoryProtocol {
  func getAddress() async throws -> AddressesEntity {
    .mock
  }
}

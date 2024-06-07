//
//  AddressRespository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-06.
//

import Foundation

struct AddressRespository: AddressRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol

  init(apiRequestClient: APIRequestClientProtocol) {
    self.apiRequestClient = apiRequestClient
  }

  func getAddress() async throws -> AddressesEntity {
    let model: AddressesModel = try await apiRequestClient.performRequest(
      endpoint: AddressEndpoints.addresses,
      decoder: JSONDecoder()
    )
    return model.asEntity()
  }
}

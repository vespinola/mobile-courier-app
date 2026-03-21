//
//  AddressRespository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-06.
//

import Foundation
import JustACourierAppDomain

public struct AddressRespository: AddressRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol = APIRequestClient()

  public init() { }

  public func getAddress() async throws -> AddressesEntity {
    let model: AddressesModel = try await apiRequestClient.performRequest(
      endpoint: AddressEndpoints.addresses,
      decoder: JSONDecoder()
    )

    let firstName = model.airShipments.client.clientFirstName
    let lastName = model.airShipments.client.clientLastName
    let fullName = firstName + " " + lastName

    AppData.shared.setUsername(fullName)

    return model.asEntity()
  }
}

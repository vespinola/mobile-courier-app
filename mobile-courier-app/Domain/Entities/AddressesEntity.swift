//
//  AddressesEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

final class AddressesEntity: ObservableObject {
  let airShipments: ShipmentsEntity
  let seaShipments: ShipmentsEntity

  init(airShipments: ShipmentsEntity, seaShipments: ShipmentsEntity) {
    self.airShipments = airShipments
    self.seaShipments = seaShipments
  }
}

struct ShipmentsEntity {
  let city: String
  var client: ClientEntity?
  let address: String
  let company: String
  let country: String
  let phone: String
}

struct ClientEntity {
  let id: Int
  let authorizeEmail: Int
  let authorizedCi: String
  let city: Int
  let clientCellPhone: String
  let clientCi: String
  let clientPhone: String
  let taxId: String
  let rate: Double
  let userName: String
}

extension AddressesEntity {
  var documentNumber: String {
    airShipments.client?.clientCi ?? "-"
  }

  var phoneNumber: String {
    airShipments.client?.clientCellPhone ?? "-"
  }

  var email: String {
    airShipments.client?.userName ?? "-"
  }
}

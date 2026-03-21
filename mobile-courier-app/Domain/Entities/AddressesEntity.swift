//
//  AddressesEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

public final class AddressesEntity: ObservableObject {
  public let airShipments: ShipmentsEntity
  public let seaShipments: ShipmentsEntity

  public init(airShipments: ShipmentsEntity, seaShipments: ShipmentsEntity) {
    self.airShipments = airShipments
    self.seaShipments = seaShipments
  }
}

public struct ShipmentsEntity {
  public let city: String
  public var client: ClientEntity?
  public let address: String
  public let company: String
  public let country: String
  public let phone: String

  public init(city: String, client: ClientEntity? = nil, address: String, company: String, country: String, phone: String) {
    self.city = city
    self.client = client
    self.address = address
    self.company = company
    self.country = country
    self.phone = phone
  }
}

public struct ClientEntity {
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

  public init(id: Int, authorizeEmail: Int, authorizedCi: String, city: Int, clientCellPhone: String, clientCi: String, clientPhone: String, taxId: String, rate: Double, userName: String) {
    self.id = id
    self.authorizeEmail = authorizeEmail
    self.authorizedCi = authorizedCi
    self.city = city
    self.clientCellPhone = clientCellPhone
    self.clientCi = clientCi
    self.clientPhone = clientPhone
    self.taxId = taxId
    self.rate = rate
    self.userName = userName
  }
}

public extension AddressesEntity {
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

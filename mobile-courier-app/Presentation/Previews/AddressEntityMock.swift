//
//  AddressEntityMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-22.
//

import Foundation

extension AddressesEntity {
  static var mock: AddressesEntity {
    let client = ClientEntity(
      id: 12345,
      authorizeEmail: 1,
      authorizedCi: "1234567-3",
      city: 1,
      clientCellPhone: "0981123123",
      clientCi: "12345678",
      clientPhone: "0982123321",
      taxId: "1112223-4",
      rate: 22.5,
      userName: "test@gmail.com"
    )

    let seaShipments = ShipmentsEntity(
      city: "Asuncion",
      client: client,
      address: "Direccion",
      company: "empresa",
      country: "Paraguay",
      phone: "0982333111"
    )

    let airShipments = seaShipments

    return .init(airShipments: airShipments, seaShipments: seaShipments)
  }
}

extension PackageEntity {
  static var mock: PackageEntity {
    .init(
      status: "c",
      shipmentStatus: "c",
      packagePickupDate: "2024-05-10T04:00:00Z",
      shipmentMethod: "Air shipment",
      clientPriceRate: 22,
      packageDescription: "It's a package",
      packageTrackingNumber: "Tracking",
      quotation: 7450,
      shipmentDate: "2024-05-10T04:00:00Z",
      packageWeight: 1.2,
      shipmentCode: 2143,
      id: 1,
      packagePrice: 5000
    )
  }

  static var atBranchMock: PackageEntity {
    .init(
      status: "B",
      shipmentStatus: "ASUNCION",
      packagePickupDate: "2024-05-10T04:00:00Z",
      shipmentMethod: "Air shipment",
      clientPriceRate: 22,
      packageDescription: "It's a package",
      packageTrackingNumber: "Tracking",
      quotation: 7450,
      shipmentDate: "2024-05-10T04:00:00Z",
      packageWeight: 1.2,
      shipmentCode: 2142,
      id: 1,
      packagePrice: 5000
    )
  }
}

extension GroupedPackageEntity {
  static var mock: GroupedPackageEntity {
    .init(shipmentCode: 2223, packages: [
      .mock,
    ])
  }
}

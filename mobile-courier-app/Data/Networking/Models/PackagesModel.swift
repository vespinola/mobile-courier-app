//
//  PackagesModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

struct PackagesModel: Codable {
  let packages: [PackageModel]

  enum CodingKeys: String, CodingKey {
    case packages = "paquetes"
  }
}

struct PackageModel: Codable {
  let status: String
  let shipmentStatus: String
  var packagePickupDate: String?
  let shipmentMethod: String
  let clientPriceRate: Decimal
  let packageDescription: String
  let packageTrackingNumber: String
  let quotation: Decimal
  let shipmentDate: String
  let packageWeight: Decimal
  let shipmentCode: Int
  let id: Int
  let packagePrice: Decimal

  enum CodingKeys: String, CodingKey {
    case status = "estado"
    case shipmentStatus = "embarqueestado"
    case packagePickupDate = "paquetefecharetiro"
    case shipmentMethod = "embarquemedio"
    case clientPriceRate = "tarifapreciocli"
    case packageDescription = "paquetedescripcion"
    case packageTrackingNumber = "paquetetracking"
    case quotation = "cotizacion"
    case shipmentDate = "embarquefecha"
    case packageWeight = "paquetepeso"
    case shipmentCode = "embarquecodigo"
    case id
    case packagePrice = "paqueteprecio"
  }
}

extension PackageModel {
  func asEntity() -> PackageEntity {
    return PackageEntity(
      status: status,
      shipmentStatus: shipmentStatus,
      packagePickupDate: packagePickupDate ?? "",
      shipmentMethod: shipmentMethod,
      clientPriceRate: clientPriceRate,
      packageDescription: packageDescription,
      packageTrackingNumber: packageTrackingNumber,
      quotation: quotation,
      shipmentDate: shipmentDate,
      packageWeight: packageWeight,
      shipmentCode: shipmentCode,
      id: id,
      packagePrice: packagePrice
    )
  }
}
extension PackagesModel {
  func asEntity() -> [GroupedPackageEntity] {
    Dictionary(grouping: packages, by: { $0.shipmentCode })
      .sorted(by: {
        Int($0.key) > Int($1.key)
      })
      .map {
        GroupedPackageEntity(
          shipmentCode: $0.key,
          packages: $0.value.map { $0.asEntity() }
        )
      }
  }
}

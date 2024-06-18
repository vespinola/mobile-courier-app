//
//  PackagesRepositoryMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-16.
//

import Foundation

struct PackagesRepositoryMock: PackagesRepositoryProtocol {
  func getPackagesRetrieved() async throws -> [GroupedPackageEntity] {
    [
      .init(embarqueCodigo: 2143, paquetes: [ .mock ])
    ]
  }
}

extension PackageEntity {
  static var mock: PackageEntity {
    .init(
      estado: "c",
      embarqueEstado: "c",
      paqueteFechaRetiro: "2024-05-10T04:00:00Z",
      embarqueMedio: "Air shipment",
      tarifaPrecioCli: 22,
      paqueteDescripcion: "It's a package",
      paqueteTracking: "Tracking",
      cotizacion: 7450,
      embarqueFecha: "2024-05-10T04:00:00Z",
      paquetePeso: 1.2,
      embarqueCodigo: 2143,
      id: 1,
      paquetePrecio: 5000)
  }
}

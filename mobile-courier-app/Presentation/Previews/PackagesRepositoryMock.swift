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
      .init(embarqueCodigo: 1, paquetes: [ .mock ])
    ]
  }
}

extension PackageEntity {
  static var mock: PackageEntity {
    .init(
      estado: "c",
      embarqueEstado: "c",
      paqueteFechaRetiro: "2024-06-14",
      embarqueMedio: "Air shipment",
      tarifaPrecioCli: 22,
      paqueteDescripcion: "It's a package",
      paqueteTracking: "Tracking",
      cotizacion: 7450,
      embarqueFecha: "2024-06-01",
      paquetePeso: 3,
      embarqueCodigo: 2,
      id: 1,
      paquetePrecio: 5000)
  }
}

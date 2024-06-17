//
//  PackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

struct GroupedPackageEntity: Identifiable {
  var id: Int { embarqueCodigo }

  var embarqueCodigo: Int
  var paquetes: [PackageEntity]

  var cost: Decimal? {
    paquetes.first?.guaraniesCost
  }

  var weight: Decimal? {
    paquetes.first?.paquetePeso
  }
}

struct PackageEntity: Codable, Identifiable {
  let estado: String
  let embarqueEstado: String
  let paqueteFechaRetiro: String
  let embarqueMedio: String
  let tarifaPrecioCli: Decimal
  let paqueteDescripcion: String
  let paqueteTracking: String
  let cotizacion: Decimal
  let embarqueFecha: String
  let paquetePeso: Decimal
  let embarqueCodigo: Int
  let id: Int
  let paquetePrecio: Decimal
}

extension PackageEntity {
  var guaraniesCost: Decimal {
    tarifaPrecioCli * cotizacion * paquetePeso
  }
}

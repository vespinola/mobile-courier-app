//
//  PackagesModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

struct PackagesModel: Codable {
  let paquetes: [PackageModel]
}

struct PackageModel: Codable {
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

  enum CodingKeys: String, CodingKey {
    case estado
    case embarqueEstado = "embarqueestado"
    case paqueteFechaRetiro = "paquetefecharetiro"
    case embarqueMedio = "embarquemedio"
    case tarifaPrecioCli = "tarifapreciocli"
    case paqueteDescripcion = "paquetedescripcion"
    case paqueteTracking = "paquetetracking"
    case cotizacion
    case embarqueFecha = "embarquefecha"
    case paquetePeso = "paquetepeso"
    case embarqueCodigo = "embarquecodigo"
    case id
    case paquetePrecio = "paqueteprecio"
  }
}

extension PackageModel {
  func asEntity() -> PackageEntity {
    .init(
      estado: estado,
      embarqueEstado: embarqueEstado,
      paqueteFechaRetiro: paqueteFechaRetiro,
      embarqueMedio: embarqueMedio,
      tarifaPrecioCli: tarifaPrecioCli,
      paqueteDescripcion: paqueteDescripcion,
      paqueteTracking: paqueteTracking,
      cotizacion: cotizacion,
      embarqueFecha: embarqueFecha,
      paquetePeso: paquetePeso,
      embarqueCodigo: embarqueCodigo,
      id: id,
      paquetePrecio: paquetePrecio
    )
  }
}

extension PackagesModel {
  func asEntity() -> [GroupedPackageEntity] {
    Dictionary(grouping: paquetes, by: { $0.embarqueCodigo })
      .sorted(by: {
        Int($0.key) > Int($1.key)
      })
      .map {
        GroupedPackageEntity(
          embarqueCodigo: $0.key,
          paquetes: $0.value.map { $0.asEntity() }
        )
      }
  }
}

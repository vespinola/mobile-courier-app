//
//  AddressEntityMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-22.
//

import Foundation

extension AddressesEntity {
  static var mock: AddressesEntity {
    let cliente = ClienteEntity(
      id: 12345,
      autorizaEmail: 1,
      ciautorizado: "1234567-3",
      ciudad: 1,
      clienteCelular: "0981123123",
      clienteCi: "12345678",
      clienteTelefono: "0982123321",
      ruc: "1112223-4",
      tarifa: 22.5,
      userName: "test@gmail.com")
    let enviosMaritimos = EnviosEntity(ciudad: "Asuncion", cliente: cliente, direccion: "Direccion", empresa: "empresa", pais: "Paraguay", telefono: "0982333111")
    let enviosAeros = enviosMaritimos
    return .init(enviosAereos: enviosAeros, viaMaritima: enviosMaritimos)
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

  static var atBranchMock: PackageEntity {
    .init(
      estado: "B",
      embarqueEstado: "ASUNCION",
      paqueteFechaRetiro: "2024-05-10T04:00:00Z",
      embarqueMedio: "Air shipment",
      tarifaPrecioCli: 22,
      paqueteDescripcion: "It's a package",
      paqueteTracking: "Tracking",
      cotizacion: 7450,
      embarqueFecha: "2024-05-10T04:00:00Z",
      paquetePeso: 1.2,
      embarqueCodigo: 2142,
      id: 1,
      paquetePrecio: 5000)
  }
}

extension GroupedPackageEntity {
  static var mock: GroupedPackageEntity {
    .init(embarqueCodigo: 2223, paquetes: [
      .mock,
    ])
  }
}

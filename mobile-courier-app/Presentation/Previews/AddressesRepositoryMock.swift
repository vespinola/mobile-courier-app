//
//  AddressesRepositoryMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-07.
//

import Foundation

struct AddressesRepositoryMock: AddressRepositoryProtocol {
  func getAddress() async throws -> AddressesEntity {
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

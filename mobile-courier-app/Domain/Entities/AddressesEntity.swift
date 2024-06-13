//
//  AddressesEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

struct AddressesEntity: Codable {
  let enviosAereos: EnviosEntity
  let viaMaritima: EnviosEntity
}

struct EnviosEntity: Codable {
  let ciudad: String
  var cliente: ClienteEntity?
  let direccion: String
  let empresa: String
  let pais: String
  let telefono: String
}

struct ClienteEntity: Codable {
  let id: Int
  let autorizaEmail: Int
  let ciautorizado: String
  let ciudad: Int
  let clienteCelular: String
  let clienteCi: String
  let clienteTelefono: String
  let ruc: String
  let tarifa: Double
  let userName: String
}

extension AddressesEntity {
  var documentNumber: String {
    enviosAereos.cliente?.clienteCi ?? "-"
  }

  var phoneNumber: String {
    enviosAereos.cliente?.clienteTelefono ?? "-"
  }

  var email: String {
    enviosAereos.cliente?.userName ?? "-"
  }
}

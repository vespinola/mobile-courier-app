//
//  AddressesEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

final class AddressesEntity: ObservableObject {
  let enviosAereos: EnviosEntity
  let viaMaritima: EnviosEntity

  init(enviosAereos: EnviosEntity, viaMaritima: EnviosEntity) {
    self.enviosAereos = enviosAereos
    self.viaMaritima = viaMaritima
  }
}

struct EnviosEntity {
  let ciudad: String
  var cliente: ClienteEntity?
  let direccion: String
  let empresa: String
  let pais: String
  let telefono: String
}

struct ClienteEntity {
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
    enviosAereos.cliente?.clienteCelular ?? "-"
  }

  var email: String {
    enviosAereos.cliente?.userName ?? "-"
  }
}

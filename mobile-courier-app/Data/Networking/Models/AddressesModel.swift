//
//  AddressesModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

struct AddressesModel: Codable {
  let enviosAereos: EnviosModel
  let viaMaritima: EnviosModel
}

struct EnviosModel: Codable {
  let ciudad: String
  let cliente: ClienteModel
  let direccion: String
  let empresa: String
  let pais: String
  let telefono: String
}

struct ClienteModel: Codable {
  let classType: String
  let id: Int
  let apellidoAutorizado: String
  let autorizaEmail: Int
  let ciautorizado: String
  let ciudad: Int
  let clienteApellido: String
  let clienteCelular: String
  let clienteCi: String
  let clienteDireccion: String
  let clienteNombre: String
  let clienteObservacion: String
  let clienteTelefono: String
  let diaNac: Int
  let estado: Int
  let estante: String
  let mesNac: Int
  let nombreAutorizado: String
  let pagoAnualidad: String?
  let password: String
  let ruc: String
  let tarifa: Double
  let username: String

  enum CodingKeys: String, CodingKey {
    case classType = "class"
    case id, apellidoAutorizado = "apellidoautorizado", autorizaEmail = "autorizaemail", ciautorizado, ciudad
    case clienteApellido = "clienteapellido", clienteCelular = "clientecelular", clienteCi = "clienteci"
    case clienteDireccion = "clientedireccion", clienteNombre = "clientenombre", clienteObservacion = "clienteobservacion"
    case clienteTelefono = "clientetelefono", diaNac = "dianac", estado, estante, mesNac = "mesnac"
    case nombreAutorizado = "nombreautorizado", pagoAnualidad, password, ruc, tarifa, username
  }
}

extension AddressesModel {
  func asEntity() -> AddressesEntity {
    .init(
      enviosAereos: enviosAereos.asEntity(),
      viaMaritima: viaMaritima.asEntity()
    )
  }
}

extension EnviosModel {
  func asEntity() -> EnviosEntity {
    .init(
      ciudad: ciudad,
      cliente: cliente.asEntity(),
      direccion: direccion,
      empresa: empresa,
      pais: pais,
      telefono: telefono
    )
  }
}

extension ClienteModel {
  func asEntity() -> ClienteEntity {
    .init(
      id: id,
      autorizaEmail: autorizaEmail,
      ciautorizado: ciautorizado,
      ciudad: ciudad,
      clienteCelular: clienteCelular,
      clienteCi: clienteCi,
      clienteTelefono: clienteTelefono,
      ruc: ruc,
      tarifa: tarifa, 
      userName: username
    )
  }
}

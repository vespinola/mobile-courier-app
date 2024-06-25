//
//  AddressesModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

struct AddressesModel: Codable {
  let airShipments: ShipmentsModel
  let seaShipments: ShipmentsModel

  enum CodingKeys: String, CodingKey {
    case airShipments = "enviosAereos"
    case seaShipments = "viaMaritima"
  }
}

struct ShipmentsModel: Codable {
  let city: String
  let client: ClientModel
  let address: String
  let company: String
  let country: String
  let phone: String

  enum CodingKeys: String, CodingKey {
    case city = "ciudad"
    case client = "cliente"
    case address = "direccion"
    case company = "empresa"
    case country = "pais"
    case phone = "telefono"
  }
}

struct ClientModel: Codable {
  let classType: String
  let id: Int
  let authorizedLastName: String
  let authorizeEmail: Int
  let authorizedCi: String
  let city: Int
  let clientLastName: String
  let clientCellPhone: String
  let clientCi: String
  let clientAddress: String
  let clientFirstName: String
  let clientNotes: String
  let clientPhone: String
  let birthDay: Int
  let status: Int
  let shelf: String
  let birthMonth: Int
  let authorizedFirstName: String
  let annualPayment: String?
  let password: String
  let taxId: String
  let rate: Double
  let username: String

  enum CodingKeys: String, CodingKey {
    case classType = "class"
    case id
    case authorizedLastName = "apellidoautorizado"
    case authorizeEmail = "autorizaemail"
    case authorizedCi = "ciautorizado"
    case city = "ciudad"
    case clientLastName = "clienteapellido"
    case clientCellPhone = "clientecelular"
    case clientCi = "clienteci"
    case clientAddress = "clientedireccion"
    case clientFirstName = "clientenombre"
    case clientNotes = "clienteobservacion"
    case clientPhone = "clientetelefono"
    case birthDay = "dianac"
    case status = "estado"
    case shelf = "estante"
    case birthMonth = "mesnac"
    case authorizedFirstName = "nombreautorizado"
    case annualPayment = "pagoanualidad"
    case password
    case taxId = "ruc"
    case rate = "tarifa"
    case username
  }
}

extension AddressesModel {
  func asEntity() -> AddressesEntity {
    .init(
      airShipments: airShipments.asEntity(),
      seaShipments: seaShipments.asEntity()
    )
  }
}

extension ShipmentsModel {
  func asEntity() -> ShipmentsEntity {
    .init(
      city: city,
      client: client.asEntity(),
      address: address,
      company: company,
      country: country,
      phone: phone
    )
  }
}

extension ClientModel {
  func asEntity() -> ClientEntity {
    .init(
      id: id,
      authorizeEmail: authorizeEmail,
      authorizedCi: authorizedCi,
      city: city,
      clientCellPhone: clientCellPhone,
      clientCi: clientCi,
      clientPhone: clientPhone,
      taxId: taxId,
      rate: rate,
      userName: username
    )
  }
}

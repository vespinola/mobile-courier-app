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

  var totalCost: Decimal {
    let thousand: Decimal = 1000
    let cost = paquetes.reduce(.zero) {
      $0 + $1.guaraniesCost
    }

    let divided = cost / thousand
    let rounded = NSDecimalNumber(decimal: divided).rounding(accordingToBehavior: nil)
    return rounded.multiplying(by: thousand as NSDecimalNumber) as Decimal
  }

  var totalWeight: Decimal {
    paquetes.reduce(.zero) {
      $0 + $1.paquetePeso
    }
  }

  var formattedTotalCost: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = .zero
    formatter.allowsFloats = false
    formatter.groupingSeparator = "."

    let formattedValue = NSDecimalNumber(decimal: totalCost)
    return formatter.string(from: formattedValue) ?? "0"
  }

  var formattedDate: String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    guard let firstDate = paquetes.first?.embarqueFecha,
          let date = inputDateFormatter.date(from: firstDate) else { return "" }

    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = "MMMM d, yyyy"

    let formattedDateString = outputDateFormatter.string(from: date)

    return formattedDateString
  }

  var formattedId: String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = .zero
    formatter.allowsFloats = false
    formatter.groupingSeparator = ""

    let formattedValue = NSDecimalNumber(integerLiteral: embarqueCodigo)
    return formatter.string(from: formattedValue) ?? "0"
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

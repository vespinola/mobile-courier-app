//
//  PackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

enum PackageStatus {
  case inLocker        // En casilla
  case onTheWay        // En camino
  case processing      // Procesando
  case readyForPickup  // Listo para retirar
  case inconsistent    // Inconsistente
  case unknown         // -1
}

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

    let formattedValue = NSDecimalNumber(value: embarqueCodigo)
    return formatter.string(from: formattedValue) ?? "0"
  }

  var packageCurrentStatus: PackageStatus {
    guard let shippingStatus = paquetes.first?.embarqueEstado,
          let status = paquetes.first?.estado else {
      return .unknown
    }
    if shippingStatus.caseInsensitiveCompare("ORIGEN") == .orderedSame {
      return .inLocker
    } else if shippingStatus.caseInsensitiveCompare("TRANSITO") == .orderedSame {
      return .onTheWay
    } else if shippingStatus.caseInsensitiveCompare("UBICANDO") == .orderedSame && status.caseInsensitiveCompare("A") == .orderedSame {
      return .processing
    } else if (shippingStatus.caseInsensitiveCompare("UBICANDO") == .orderedSame || shippingStatus.caseInsensitiveCompare("ASUNCION") == .orderedSame) && status.caseInsensitiveCompare("B") == .orderedSame {
      return .readyForPickup
    }

    return status.caseInsensitiveCompare("C") == .orderedSame ? .inconsistent : .unknown
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

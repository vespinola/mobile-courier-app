//
//  PackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

enum ShipmentStatus: String, CaseIterable, Identifiable {
  case readyForPickup = "Ready for Pickup"
  case processing = "Processing"
  case onTheWay = "On the Way"
  case inLocker = "In Locker"
  case inconsistent = "Inconsistent"
  case unknown = "Unknown Status"

  var id: String { self.rawValue }
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
    let formattedValue = NSDecimalNumber(decimal: totalCost)
    return numberFormatter.string(from: formattedValue) ?? "0"
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

  var packageCurrentStatus: ShipmentStatus {
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

  private var numberFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = .zero
    formatter.allowsFloats = false
    formatter.groupingSeparator = "."
    return formatter
  }
}

extension Array where Element == GroupedPackageEntity {
  func filterGroupedPackages(by shipmentStatus: ShipmentStatus) -> [Element] {
    filter { $0.packageCurrentStatus == shipmentStatus }
  }
}

struct PackageEntity: Codable, Identifiable, Hashable {
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

  var formattedCost: String {
    let thousand: Decimal = 1000
    let divided = guaraniesCost / thousand
    let rounded = NSDecimalNumber(decimal: divided).rounding(accordingToBehavior: nil)
    let multiplied = rounded.multiplying(by: thousand as NSDecimalNumber) as Decimal
    let formattedValue = NSDecimalNumber(decimal: multiplied)
    return numberFormatter.string(from: formattedValue) ?? "0"
  }

  private var numberFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = .zero
    formatter.allowsFloats = false
    formatter.groupingSeparator = "."
    return formatter
  }
}

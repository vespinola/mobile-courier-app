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

  var localized: String {
    switch self {
    case .readyForPickup:
      return NSLocalizedString("Ready for Pickup", comment: "")
    case .processing:
      return NSLocalizedString("Processing", comment: "")
    case .onTheWay:
      return NSLocalizedString("On the Way", comment: "")
    case .inLocker:
      return NSLocalizedString("In Locker", comment: "")
    case .inconsistent:
      return NSLocalizedString("Inconsistent", comment: "")
    case .unknown:
      return NSLocalizedString("Unknown Status", comment: "")
    }
  }
}

struct GroupedPackageEntity: Identifiable {
  var id: Int { shipmentCode }

  var shipmentCode: Int
  var packages: [PackageEntity]

  var totalCost: Decimal {
    let thousand: Decimal = 1000
    let cost = packages.reduce(.zero) {
      $0 + $1.guaraniesCost
    }

    let divided = cost / thousand
    let rounded = NSDecimalNumber(decimal: divided).rounding(accordingToBehavior: nil)
    return rounded.multiplying(by: thousand as NSDecimalNumber) as Decimal
  }

  var totalWeight: Decimal {
    packages.reduce(.zero) {
      $0 + $1.packageWeight
    }
  }

  var formattedTotalCost: String {
    let formattedValue = NSDecimalNumber(decimal: totalCost)
    return numberFormatter.string(from: formattedValue) ?? "0"
  }

  var formattedDate: String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    guard let firstDate = packages.first?.shipmentDate,
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

    let formattedValue = NSDecimalNumber(value: shipmentCode)
    return formatter.string(from: formattedValue) ?? "0"
  }

  var packageCurrentStatus: ShipmentStatus {
    guard let shippingStatus = packages.first?.shipmentStatus,
          let status = packages.first?.status else {
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

struct PackageEntity: Identifiable, Hashable {
  let status: String
  let shipmentStatus: String
  let packagePickupDate: String
  let shipmentMethod: String
  let clientPriceRate: Decimal
  let packageDescription: String
  let packageTrackingNumber: String
  let quotation: Decimal
  let shipmentDate: String
  let packageWeight: Decimal
  let shipmentCode: Int
  let id: Int
  let packagePrice: Decimal
}

extension PackageEntity {
  var guaraniesCost: Decimal {
    clientPriceRate * quotation * packageWeight
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

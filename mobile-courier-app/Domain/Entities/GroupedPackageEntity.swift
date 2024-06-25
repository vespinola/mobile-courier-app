//
//  GroupedPackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import Foundation

struct GroupedPackageEntity: Identifiable {
  var id: Int { shipmentCode }

  var shipmentCode: Int
  var packages: [PackageEntity]

  var totalCost: Decimal {
    let thousand: Decimal = 1000
    let cost = packages.reduce(.zero) {
      $0 + $1.packageCostInGuaranies
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
    NSDecimalNumber(decimal: totalCost).applyFormatForAmountInGuaranies()
  }

  var formattedDate: String {
    packages.first?.formattedDate ?? ""
  }

  var formattedId: String {
    NSDecimalNumber(value: shipmentCode).applyFormatForIdentifier()
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
}

extension Array where Element == GroupedPackageEntity {
  func filterGroupedPackages(by shipmentStatus: ShipmentStatus) -> [Element] {
    filter { $0.packageCurrentStatus == shipmentStatus }
  }
}

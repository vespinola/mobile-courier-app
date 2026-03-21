//
//  GroupedPackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import Foundation

public struct GroupedPackageEntity: Identifiable {
  public var id: Int { shipmentCode }

  public var shipmentCode: Int
  public var packages: [PackageEntity]

  public init(shipmentCode: Int, packages: [PackageEntity]) {
    self.shipmentCode = shipmentCode
    self.packages = packages
  }

  public var totalCost: Decimal {
    let thousand: Decimal = 1000
    let cost = packages.reduce(.zero) {
      $0 + $1.packageCostInGuaranies
    }

    let divided = cost / thousand
    let rounded = NSDecimalNumber(decimal: divided).rounding(accordingToBehavior: nil)
    return rounded.multiplying(by: thousand as NSDecimalNumber) as Decimal
  }

  public var totalWeight: Decimal {
    packages.reduce(.zero) {
      $0 + $1.packageWeight
    }
  }

  public var formattedTotalCost: String {
    NSDecimalNumber(decimal: totalCost).applyFormatForAmountInGuaranies()
  }

  public var formattedDate: String {
    packages.first?.formattedDate ?? ""
  }

  public var shipmentDate: Date? {
    packages.first?.shipmentDate.getDateFrom(formatType: .server)
  }

  public var formattedId: String {
    NSDecimalNumber(value: shipmentCode).applyFormatForIdentifier()
  }

  public var packageCurrentStatus: ShipmentStatus {
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

  public var accessibilityLabel: String {
    NSLocalizedString(
      "Shipment \(shipmentCode) with a total cost of \(totalCost), is \(packageCurrentStatus.localized).",
      comment: ""
    )
  }
}

public extension Array where Element == GroupedPackageEntity {
  func filterGroupedPackages(by shipmentStatus: ShipmentStatus) -> [Element] {
    filter { $0.packageCurrentStatus == shipmentStatus }
  }

  func getYears() -> [String] {
    let yearList: [Int] = compactMap { $0.shipmentDate }
      .map { $0.getYear() }

    return Set(yearList)
      .sorted { $0 > $1 }
      .map { String($0) }
  }
}

//
//  PackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

public struct PackageEntity: Identifiable, Hashable {
  public let status: String
  public let shipmentStatus: String
  public let packagePickupDate: String
  public let shipmentMethod: String
  public let clientPriceRate: Decimal
  public let packageDescription: String
  public let packageTrackingNumber: String
  public let quotation: Decimal
  public let shipmentDate: String
  public let packageWeight: Decimal
  public let shipmentCode: Int
  public let id: Int
  public let packagePrice: Decimal

  public init(status: String, shipmentStatus: String, packagePickupDate: String, shipmentMethod: String, clientPriceRate: Decimal, packageDescription: String, packageTrackingNumber: String, quotation: Decimal, shipmentDate: String, packageWeight: Decimal, shipmentCode: Int, id: Int, packagePrice: Decimal) {
    self.status = status
    self.shipmentStatus = shipmentStatus
    self.packagePickupDate = packagePickupDate
    self.shipmentMethod = shipmentMethod
    self.clientPriceRate = clientPriceRate
    self.packageDescription = packageDescription
    self.packageTrackingNumber = packageTrackingNumber
    self.quotation = quotation
    self.shipmentDate = shipmentDate
    self.packageWeight = packageWeight
    self.shipmentCode = shipmentCode
    self.id = id
    self.packagePrice = packagePrice
  }
}

public extension PackageEntity {
  var packageCostInGuaranies: Decimal {
    clientPriceRate * quotation * packageWeight
  }

  var formattedDate: String? {
    shipmentDate.formatDate()
  }

  var formattedCost: String {
    let thousand: Decimal = 1000
    let divided = packageCostInGuaranies / thousand
    let rounded = NSDecimalNumber(decimal: divided).rounding(accordingToBehavior: nil)
    let multiplied = rounded.multiplying(by: thousand as NSDecimalNumber) as Decimal
    return NSDecimalNumber(decimal: multiplied).applyFormatForAmountInGuaranies()
  }
}

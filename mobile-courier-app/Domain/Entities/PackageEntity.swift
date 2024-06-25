//
//  PackageEntity.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

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

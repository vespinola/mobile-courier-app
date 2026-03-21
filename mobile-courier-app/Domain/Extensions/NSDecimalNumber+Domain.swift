//
//  NSDecimalNumber+Domain.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import Foundation

private extension NSDecimalNumber {
  var identifierFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = .zero
    formatter.allowsFloats = false
    formatter.groupingSeparator = ""
    return formatter
  }

  var guaraniesFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = .zero
    formatter.allowsFloats = false
    formatter.groupingSeparator = "."
    return formatter
  }
}

extension NSDecimalNumber {
  func applyFormatForIdentifier() -> String {
    identifierFormatter.string(from: self) ?? "0"
  }

  func applyFormatForAmountInGuaranies() -> String {
    guaraniesFormatter.string(from: self) ?? "0"
  }
}

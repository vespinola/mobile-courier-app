//
//  String+Domain.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import Foundation

extension String {
  func getDateFrom(formatType: DateFormatType) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatType.rawValue
    return dateFormatter.date(from: self)
  }

  func formatDate(
    from originalFormat: DateFormatType = .server,
    to newFormat: DateFormatType = .display
  ) -> String? {
    let originalFormatter = DateFormatter()
    originalFormatter.dateFormat = originalFormat.rawValue

    guard let originalDate = originalFormatter.date(from: self) else { return nil }

    let newFormatter = DateFormatter()
    newFormatter.dateFormat = newFormat.rawValue
    return newFormatter.string(from: originalDate)
  }
}

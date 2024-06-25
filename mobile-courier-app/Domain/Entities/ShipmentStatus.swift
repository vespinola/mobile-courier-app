//
//  ShipmentStatus.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
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

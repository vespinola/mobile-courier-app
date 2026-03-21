//
//  ShipmentStatus.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import Foundation

public enum ShipmentStatus: String, CaseIterable, Identifiable {
  case readyForPickup = "Ready for Pickup"
  case processing = "Processing"
  case onTheWay = "On the Way"
  case inLocker = "In Locker"
  case inconsistent = "Inconsistent"
  case unknown = "Unknown Status"

  public var id: String { self.rawValue }

  public var localized: String {
    switch self {
    case .readyForPickup:
      return String(localized: "Ready for Pickup")
    case .processing:
      return String(localized: "Processing")
    case .onTheWay:
      return String(localized: "On the Way")
    case .inLocker:
      return String(localized: "In Locker")
    case .inconsistent:
      return String(localized: "Inconsistent")
    case .unknown:
      return String(localized: "Unknown Status")
    }
  }
}

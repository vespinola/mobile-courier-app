//
//  PackageEndpoints.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

enum PackageEndpoints {
  case withdrawn
  case forWithdrawl
}

extension PackageEndpoints: Endpoint {
  var mockFile: String? {
    switch self {
    case .withdrawn:
      "WithdrawnPackages"
    case .forWithdrawl:
      "PackagesForWithdrawl"
    }
  }

  var requestType: RequestType {
    .get
  }

  var path: String {
    switch self {
    case .withdrawn:
      "/paquetesRetirados"
    case .forWithdrawl:
      "/paquetesPendientes"
    }
  }

  var body: [AnyHashable: Any]? {
    nil
  }

  var queryParams: [String: String]? {
    nil
  }
}

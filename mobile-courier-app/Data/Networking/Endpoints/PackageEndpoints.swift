//
//  PackageEndpoints.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

enum PackageEndpoints {
  case retrieved
}

extension PackageEndpoints: Endpoint {
  var mockFile: String? {
    ""
  }

  var requestType: RequestType {
    .get
  }

  var path: String {
    "/frontliner-middleware/api/paquetesRetirados"
  }

  var body: [AnyHashable: Any]? {
    nil
  }

  var queryParams: [String: String]? {
    nil
  }
}

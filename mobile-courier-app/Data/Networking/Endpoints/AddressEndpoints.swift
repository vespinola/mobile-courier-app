//
//  AddressEndpoints.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-05.
//

import Foundation

enum AddressEndpoints {
  case addresses
}

extension AddressEndpoints: Endpoint {
  var mockFile: String? {
    "Address"
  }

  var requestType: RequestType {
    .get
  }

  var path: String {
    "/direccion"
  }

  var body: [AnyHashable: Any]? {
    nil
  }

  var queryParams: [String: String]? {
    nil
  }
}

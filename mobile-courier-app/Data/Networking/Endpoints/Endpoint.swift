//
//  Endpoint.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import Foundation

enum RequestType: String {
  case get = "GET"
  case post = "POST"
}

protocol Endpoint {
  var scheme: String { get }
  var requestType: RequestType { get }
  var host: String { get }
  var path: String { get }
  var headers: [String: String] { get }
  var body: [AnyHashable: Any]? { get }
  var queryParams: [String: String]? { get }
  var authToken: String? { get }
  var port: Int { get }

  #if DEBUG
  var mockFile: String? { get }
  #endif
}

extension Endpoint {
  var scheme: String { "https" }
  var host: String { "frontliner.com.py" }
  var port: Int { 8449 }
  var headers: [String: String] {
    var internalHeaders = [
      "Content-Type": "application/json"
    ]

    if let authToken = authToken {
      internalHeaders["Authorization"] = "Bearer \(authToken)"
    }

    return internalHeaders
  }

  var authToken: String? {
    guard let token = AppData.shared.getToken() else { return nil }
    return "Bearer \(token)"
  }
}

extension Endpoint {
  func asRequest(serializer: JSONSerialization.Type = JSONSerialization.self) throws -> URLRequest? {
    var urlComponent = URLComponents()
    urlComponent.scheme = scheme
    urlComponent.path = path
    urlComponent.host = host
    urlComponent.port = port

    guard let url = urlComponent.url else { return nil }

    var urlRequest = URLRequest(url: url)
    urlRequest.allHTTPHeaderFields = headers
    urlRequest.httpMethod = requestType.rawValue

    if let body = body {
      urlRequest.httpBody = try serializer.data(withJSONObject: body)
    }

    if let authToken = authToken {
      urlRequest.allHTTPHeaderFields?["authorization"] = authToken
    }

    return urlRequest
  }
}

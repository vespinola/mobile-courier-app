//
//  APIRequestClient.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-06.
//

import Foundation

enum APIErrorMessage: Error {
  case invalidRequest
  case invalidResponse
  case timeout
  case requestFailed(statusCode: Int)
  case decodeFailed
}

protocol APIRequestClientProtocol {
  func performRequest<T: Decodable>(endpoint: Endpoint, decoder: JSONDecoder) async throws -> T
}

final class APIRequestClient: NSObject, APIRequestClientProtocol {

  static var instance: APIRequestClient = .init()

  private lazy var delegate: URLSessionDelegate? = CustomSessionDelegate()

  func performRequest<T: Decodable>(endpoint: Endpoint, decoder: JSONDecoder = JSONDecoder()) async throws -> T {
    guard let urlRequest = try? endpoint.asRequest() else {
      throw APIErrorMessage.invalidRequest
    }
    
    do {
//
//      #if DEBUG
//      endpoint.mockFile =
//      #endif


      let configuration = URLSessionConfiguration.default
      configuration.timeoutIntervalForRequest = 60
      configuration.timeoutIntervalForResource = 60
      configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
      configuration.urlCache = nil

      let (data, response) = try await URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        .data(for: urlRequest)

      guard let httpResponse = response as? HTTPURLResponse else {
        throw APIErrorMessage.invalidResponse
      }

      guard (200...299).contains(httpResponse.statusCode) else {
        throw APIErrorMessage.requestFailed(statusCode: httpResponse.statusCode)
      }

      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let decodedData = try decoder.decode(T.self, from: data)
      return decodedData
    } 
    catch {
      if (error as NSError).code == NSURLErrorTimedOut {
        throw APIErrorMessage.timeout
      }

      throw error
    }
  }
}

fileprivate class CustomSessionDelegate: NSObject, URLSessionDelegate {
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    // Check if the challenge is a server trust challenge
    guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
          let serverTrust = challenge.protectionSpace.serverTrust else {
      // If it's not a server trust challenge, perform default handling
      completionHandler(.performDefaultHandling, nil)
      return
    }

    // Bypass SSL certificate validation by always trusting the server
    let credential = URLCredential(trust: serverTrust)
    completionHandler(.useCredential, credential)
  }
}

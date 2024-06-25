//
//  CustomSessionDelegate.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-12.
//

import Foundation

final class CustomSessionDelegate: NSObject, URLSessionDataDelegate {
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
          let serverTrust = challenge.protectionSpace.serverTrust else {
      completionHandler(.performDefaultHandling, nil)
      return
    }
    let credential = URLCredential(trust: serverTrust)
    completionHandler(.useCredential, credential)
  }
}

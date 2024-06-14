//
//  CustomSessionDelegate.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-12.
//

import Foundation

final class CustomSessionDelegate: NSObject, URLSessionDataDelegate {
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
    do {
      let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
      let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])

      if let jsonString = String(data: jsonData, encoding: .utf8) {
        let urlString = dataTask.currentRequest?.url?.absoluteString ?? "Unknown URL"
        print("Data received from '\(urlString)' ➡️ \n\(jsonString)")
      }
    } catch {
      print("Failed to parse JSON: \(error.localizedDescription)")
    }
  }

  func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    if let error = error {
      print("Error: \(error.localizedDescription)")
    } else {
      print("Request completed successfully.")
    }
  }
}

extension CustomSessionDelegate {
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

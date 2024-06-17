//
//  PackagesRepositoryProtocol.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

protocol PackagesRepositoryProtocol {
  func getPackagesRetrieved() async throws -> [GroupedPackageEntity]
}
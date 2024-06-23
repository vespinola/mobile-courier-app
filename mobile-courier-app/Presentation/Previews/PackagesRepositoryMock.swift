//
//  PackagesRepositoryMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-16.
//

import Foundation

struct PackagesRepositoryMock: PackagesRepositoryProtocol {
  func getPackagesForWithdrawl() async throws -> [GroupedPackageEntity] {
    [
      .init(embarqueCodigo: 2223, paquetes: [
        .mock,
      ]),
      .init(embarqueCodigo: 2221, paquetes: [
        .atBranchMock
      ]),
    ]
  }

  func getWithdrawnPackages() async throws -> [GroupedPackageEntity] {
    [
      .init(embarqueCodigo: 2143, paquetes: [ .mock ])
    ]
  }
}

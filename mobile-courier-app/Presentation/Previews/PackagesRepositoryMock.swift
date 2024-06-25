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
      .init(shipmentCode: 2223, packages: [
        .mock,
      ]),
      .init(shipmentCode: 2221, packages: [
        .atBranchMock
      ]),
    ]
  }

  func getWithdrawnPackages() async throws -> [GroupedPackageEntity] {
    [
      .init(shipmentCode: 2143, packages: [ .mock ])
    ]
  }
}

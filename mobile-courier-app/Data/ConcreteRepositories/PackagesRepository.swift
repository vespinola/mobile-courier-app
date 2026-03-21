//
//  PackagesRepository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation
import JustACourierAppDomain

public struct PackagesRepository: PackagesRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol = APIRequestClient()

  public init() { }

  public func getWithdrawnPackages() async throws -> [GroupedPackageEntity] {
    let model: PackagesModel = try await apiRequestClient.performRequest(
      endpoint: PackageEndpoints.withdrawn,
      decoder: JSONDecoder()
    )

    return model.asEntity()
  }

  public func getPackagesForWithdrawl() async throws -> [GroupedPackageEntity] {
    let model: PackagesModel = try await apiRequestClient.performRequest(
      endpoint: PackageEndpoints.forWithdrawl,
      decoder: JSONDecoder()
    )

    return model.asEntity()
  }
}

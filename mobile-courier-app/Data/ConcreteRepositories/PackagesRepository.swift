//
//  PackagesRepository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

struct PackagesRepository: PackagesRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol

  init(apiRequestClient: APIRequestClientProtocol) {
    self.apiRequestClient = apiRequestClient
  }

  func getPackagesRetrieved() async throws -> [GroupedPackageEntity] {
    let model: PackagesModel = try await apiRequestClient.performRequest(
      endpoint: PackageEndpoints.retrieved,
      decoder: JSONDecoder()
    )

    return model.asEntity()
  }
}

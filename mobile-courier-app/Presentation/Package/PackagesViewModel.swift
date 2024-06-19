//
//  PackagesViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

final class PackagesViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var toastMessage: String?
  @Published var groupedPackagesEntity: [GroupedPackageEntity]?

  private let packagesRepository: PackagesRepositoryProtocol

  init(packagesRepository: PackagesRepositoryProtocol) {
    self.packagesRepository = packagesRepository
  }

  @MainActor
  func getPackages() async {
    do {
      isLoading = true
      groupedPackagesEntity = try await packagesRepository.getPackagesRetrieved()
      isLoading = false
    } catch {
      isLoading = false
      toastMessage = error.localizedDescription
    }
  }
}

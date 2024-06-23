//
//  PackagesForWithdrawalViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-18.
//

import Foundation

final class PackagesForWithdrawalViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var toastMessage: String?
  @Published var groupedPackagesEntity: [GroupedPackageEntity]?

  private let packagesRepository: PackagesRepositoryProtocol

  init(packagesRepository: PackagesRepositoryProtocol) {
    self.packagesRepository = packagesRepository
  }

  @MainActor
  func getPackages() async {
    guard groupedPackagesEntity == nil else { return }

    do {
      isLoading = true
      groupedPackagesEntity = try await packagesRepository.getPackagesForWithdrawl()
      isLoading = false
    } catch {
      isLoading = false
      toastMessage = error.localizedDescription
    }
  }
}

//
//  WithdrawnPackagesViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import Foundation

final class WithdrawnPackagesViewModel: ObservableObject {
  private enum Constants {
    static var currentYear: String { "\(Date.now.getYear())" }
  }

  @Published var isLoading: Bool = false
  @Published var toastMessage: String?
  @Published var groupedPackagesEntity: [GroupedPackageEntity]?
  @Published var selectedYear: String = Constants.currentYear

  var filteredGroupedPackages: [GroupedPackageEntity]? {
    groupedPackagesEntity?.filter { $0.formattedDate.contains(selectedYear) }
  }

  var getYearsForFiltering: [String] {
    groupedPackagesEntity?.getYears() ?? []
  }

  private let packagesRepository: PackagesRepositoryProtocol

  init(packagesRepository: PackagesRepositoryProtocol) {
    self.packagesRepository = packagesRepository
  }

  @MainActor
  func getPackages(forceUpdate: Bool = false) async {
    guard groupedPackagesEntity == nil || forceUpdate else { return }

    if forceUpdate {
      selectedYear = Constants.currentYear
    }

    defer { isLoading = false }

    do {
      isLoading = true
      groupedPackagesEntity = try await packagesRepository.getWithdrawnPackages()
    } catch {
      toastMessage = error.localizedDescription
    }
  }
}

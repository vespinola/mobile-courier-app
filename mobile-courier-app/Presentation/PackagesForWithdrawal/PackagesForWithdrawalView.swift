//
//  PackagesForWithdrawalView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-18.
//

import SwiftUI

struct PackagesForWithdrawalView: View {
  @ObservedObject var viewModel: PackagesForWithdrawalViewModel

  var body: some View {
    ZStack {
      if let groupedPackagesEntity = viewModel.groupedPackagesEntity {
        content(for: groupedPackagesEntity)
      }

      if viewModel.isLoading {
        RippleSpinnerView()
      }
    }
    .onAppear {
      Task {
        await viewModel.getPackages()
      }
    }
    .toast(message: $viewModel.toastMessage)
  }

  @ViewBuilder
  private func content(for groupedPackages: [GroupedPackageEntity]) -> some View {
    if groupedPackages.isEmpty {
      PackagePlaceholderView()
    } else {
      packagesList(groupedPackages)
    }
  }

  @ViewBuilder
  private func packagesList(_ groupedPackages: [GroupedPackageEntity]) -> some View {
    List(groupedPackages) { row in
      getGroupedPackageView(for: row)
    }
    .listStyle(.plain)
  }

  @ViewBuilder
  private func getGroupedPackageView(for groupedPackage: GroupedPackageEntity) -> some View {
    if groupedPackage.packageCurrentStatus == .readyForPickup {
      GroupedPackageReadyView(groupedPackage: groupedPackage)
    } else {
      GroupedPackageRowView(groupedPackage: groupedPackage)
    }
  }
}

#Preview {
  PackagesForWithdrawalView(viewModel: .previewInstance())
}

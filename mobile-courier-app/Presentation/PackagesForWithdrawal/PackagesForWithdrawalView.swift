//
//  PackagesForWithdrawalView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-18.
//

import SwiftUI

struct PackagesForWithdrawalView: View {
  @ObservedObject var viewModel: PackagesForWithdrawalViewModel
  @EnvironmentObject var coordinator: Coordinator

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
      packageList(groupedPackages)
    }
  }

  @ViewBuilder
  private func packageList(_ groupedPackages: [GroupedPackageEntity]) -> some View {
    List {
      ForEach(ShipmentStatus.allCases) { status in
        if !groupedPackages.filterGroupedPackages(by: status).isEmpty {
          Section(header: Text(status.rawValue)) {
            ForEach(groupedPackages.filter { $0.packageCurrentStatus == status }) { currentGroupedPackage in
              getGroupedPackageView(for: currentGroupedPackage)
            }
          }
        }
      }
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
    .environmentObject(Coordinator(diContainer: AppDIContainer()))
}

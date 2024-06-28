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
    }
    .onAppear {
      getPackages()
    }
    .refreshable {
      getPackages(forceUpdate: true)
    }
    .showRippleSpinner(isLoading: $viewModel.isLoading)
    .toast(message: $viewModel.toastMessage)
  }

  private func getPackages(forceUpdate: Bool = false) {
    Task {
      await viewModel.getPackages(forceUpdate: forceUpdate)
    }
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
          getSection(for: status, groupedPackages: groupedPackages)
        }
      }
    }
    .listStyle(.plain)
  }

  @ViewBuilder
  private func getSection(for status: ShipmentStatus, groupedPackages: [GroupedPackageEntity]) -> some View {
    Section(header: Text(status.localized)) {
      ForEach(groupedPackages.filter { $0.packageCurrentStatus == status }) { currentGroupedPackage in
        getGroupedPackageView(for: currentGroupedPackage)
          .groupedPackageRowStyle()
          .onTapGesture {
            coordinator.present(
              sheet: .shipmentDetail(groupedPackage: currentGroupedPackage)
            )
          }
          .accessibilityElement(children: .ignore)
          .accessibilityLabel(currentGroupedPackage.accessibilityLabel)
          .accessibilityIdentifier(
            AccessibilityIdentifiers
              .GroupedPackageRowView
              .get(identifier: "\(currentGroupedPackage.id)")
          )
      }
    }
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
    .environmentObject(Coordinator(diContainer: AppDIContainerMock()))
}

//
//  WithdrawnPackagesView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import SwiftUI

struct WithdrawnPackagesView: View {
  @ObservedObject var viewModel: WithdrawnPackagesViewModel
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
    .sheet(item: $coordinator.sheet) { sheet in
      coordinator.build(sheet: sheet)
    }
    .onAppear {
      print("haha")
      Task {
        await viewModel.getPackages()
      }
    }
    .onDisappear {
      print("hoho")
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
      Button {
        coordinator.present(sheet: .shipmentDetail(groupedPackage: row))
      } label: {
        GroupedPackageRowView(groupedPackage: row)
      }
      .buttonStyle(.plain)
      .listRowBackground(EmptyView())
      .listRowSeparator(.hidden)
      .listRowSpacing(.zero)
      .listRowInsets(.none)
    }
    .listStyle(.plain)
  }
}

#Preview {
  WithdrawnPackagesView(viewModel: .previewInstance())
    .environmentObject(Coordinator(diContainer: AppDIContainer()))
}

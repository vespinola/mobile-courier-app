//
//  WithdrawnPackagesView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import SwiftUI

struct WithdrawnPackagesView: View {
  @ObservedObject var viewModel: WithdrawnPackagesViewModel

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
      GroupedPackageRowView(groupedPackage: row)
    }
    .listStyle(.plain)
  }
}

#Preview {
  WithdrawnPackagesView(viewModel: .previewInstance())
}

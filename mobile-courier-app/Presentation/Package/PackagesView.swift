//
//  PackagesView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import SwiftUI

struct PackagesView: View {
  @ObservedObject var viewModel: PackagesViewModel

  var body: some View {
    ZStack {
      VStack {
        if let groupedPackagesEntity = viewModel.groupedPackagesEntity {
          if groupedPackagesEntity.isEmpty {
            PackagePlaceholderView()
          } else {
            List(groupedPackagesEntity) { row in
              GroupedPackageRowView(groupedPackage: row)
            }
          }
        }
      }

      if viewModel.isLoading, viewModel.groupedPackagesEntity != nil {
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
}

#Preview {
  PackagesView(viewModel: .previewInstance())
}

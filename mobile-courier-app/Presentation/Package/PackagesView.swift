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
    VStack {
      if let groupedPackagesEntity = viewModel.groupedPackagesEntity {
        ScrollView {
          ForEach(groupedPackagesEntity) { currentGroupedPackages in
            PackageRowView(groupedPackage: currentGroupedPackages)
          }
        }

      } else {
        PackagePlaceholderView()
      }
    }
    .onAppear {
      Task {
        await viewModel.getPackages()
      }
    }

    if viewModel.isLoading {
      RippleSpinnerView()
    }
  }
}

#Preview {
  PackagesView(viewModel: .previewInstance())
}

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
      VStack {
        if let groupedPackagesEntity = viewModel.groupedPackagesEntity {
          if groupedPackagesEntity.isEmpty {
            PackagePlaceholderView()
          } else {
            List(groupedPackagesEntity) { row in
              GroupedPackageRowView(groupedPackage: row)
            }
            .listStyle(.plain)
          }
        }
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
}

#Preview {
  PackagesForWithdrawalView(viewModel: .previewInstance())
}

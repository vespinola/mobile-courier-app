//
//  ProfileView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-04.
//

import SwiftUI

struct ProfileView: View {
  @ObservedObject var viewModel: ProfileViewModel

  var body: some View {
    ZStack {
      if let addresses = viewModel.addresses {
        List {
          RowView(title: "Document Number", subtitle: addresses.documentNumber)
          RowView(title: "Phone Number", subtitle: addresses.phoneNumber)
          RowView(title: "Email", subtitle: addresses.email)

          EnviosView(envios: addresses.enviosAereos, title: "Air shipments")
          EnviosView(envios: addresses.viaMaritima, title: "Maritime Route")
        }
        .listRowSeparator(.hidden)
        .listStyle(.plain)
      }

      if viewModel.isLoading {
        RippleSpinnerView()
      }
    }
    .toast(message: $viewModel.toastMessage)
  }
}

#Preview {
  ProfileView(viewModel: .previewInstance())
}

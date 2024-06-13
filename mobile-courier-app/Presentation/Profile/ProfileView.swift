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
    if let addresses = viewModel.addresses {
      List {
        Section {
          RowView(title: "Document Number", subtitle: addresses.documentNumber)
          RowView(title: "Phone Number", subtitle: addresses.phoneNumber)
          RowView(title: "Email", subtitle: addresses.email)
        }

        Section {
          EnviosView(envios: addresses.enviosAereos, title: "Maritime Shipments")
          EnviosView(envios: addresses.viaMaritima, title: "Maritime Route")
        }
      }
    } else {
      RippleSpinnerView()
    }
  }
}

#Preview {
  ProfileView(viewModel: ProfileViewModel.previewInstance())
}

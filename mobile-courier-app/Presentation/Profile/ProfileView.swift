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
        ScrollView {
          self.content(addressEntity: addresses)
        }
      }

      if viewModel.isLoading {
        RippleSpinnerView()
      }
    }
    .toast(message: $viewModel.toastMessage)
  }

  @ViewBuilder
  private func content(addressEntity: AddressesEntity) -> some View {
    VStack {
      RowView(title: "Document Number", subtitle: addressEntity.documentNumber)
      RowView(title: "Phone Number", subtitle: addressEntity.phoneNumber)
      RowView(title: "Email", subtitle: addressEntity.email)
        .padding(.bottom, 32)

      ShipmentRowView(shipment: addressEntity.enviosAereos, title: "Air shipments")
      ShipmentRowView(shipment: addressEntity.viaMaritima, title: "Maritime Route")
    }
  }
}

#Preview {
  ProfileView(viewModel: .previewInstance())
}

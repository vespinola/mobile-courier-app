//
//  ProfileView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-04.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var addresses: AddressesEntity

  var body: some View {
    ScrollView {
      content(addressEntity: addresses)
    }
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
  ProfileView()
    .environmentObject(AddressesEntity.mock)
}

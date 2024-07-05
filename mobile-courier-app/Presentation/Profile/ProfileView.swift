//
//  ProfileView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-04.
//

import SwiftUI
import JustACourierAppDomain

struct ProfileView: View {
  @EnvironmentObject var addresses: AddressesEntity

  var body: some View {
    content(addressEntity: addresses)
  }

  @ViewBuilder
  private func content(addressEntity: AddressesEntity) -> some View {
      List {
        Section {
          RowView(
            title: String(localized: "Document Number"),
            subtitle: addressEntity.documentNumber
          )
          RowView(
            title: String(localized: "Phone Number"),
            subtitle: addressEntity.phoneNumber
          )
          RowView(
            title: String(localized: "Email"),
            subtitle: addressEntity.email
          )
        }

        Section {
          ShipmentRowView(
            shipment: addressEntity.airShipments,
            title: String(localized: "Air Shipments")
          )
          ShipmentRowView(
            shipment: addressEntity.seaShipments,
            title: String(localized: "Sea Shipments")
          )
        }
      }
  }
}

#Preview {
  VStack {
    HeaderView()
      .environmentObject(AppData.mock)
    ProfileView()
      .environmentObject(AddressesEntity.mock)
  }
}

#Preview {
  ProfileView()
    .environmentObject(AddressesEntity.mock)
}

//
//  EnviosView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-08.
//

import SwiftUI

struct ShipmentRowView: View {
  var shipment: ShipmentsEntity
  var title: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .fontWeight(.bold)
        .foregroundStyle(.accent)
        .padding(.bottom, 4)
      Group {
        Text(shipment.address)
        Text(shipment.city)
        Text(shipment.phone)
        Text(shipment.country)
      }
      .font(.caption)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.init(
      top: .zero,
      leading: 20,
      bottom: .zero,
      trailing: 20)
    )
  }
}

#Preview {
  ShipmentRowView(
    shipment:
        .init(
          city: "Boston",
          address: "164 NW STE 32",
          company: "",
          country: "Argentina",
          phone: "(301) 123-1234"
        ),
    title: "Envíos Marítimos"
  )
}

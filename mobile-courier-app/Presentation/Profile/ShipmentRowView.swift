//
//  EnviosView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-08.
//

import SwiftUI

struct ShipmentRowView: View {
  var shipment: EnviosEntity
  var title: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .fontWeight(.bold)
        .foregroundStyle(.accent)
        .padding(.bottom, 4)
      Group {
        Text(shipment.direccion)
        Text(shipment.ciudad)
        Text(shipment.telefono)
        Text(shipment.pais)
      }
      .font(.caption)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.init(
      top: .zero,
      leading: 20,
      bottom: 16,
      trailing: 20)
    )
  }
}

#Preview {
  ShipmentRowView(
    shipment:
        .init(
          ciudad: "Boston",
          direccion: "164 NW STE 32",
          empresa: "",
          pais: "Argentina",
          telefono: "(301) 123-1234"
        ),
    title: "Envíos Marítimos"
  )
}

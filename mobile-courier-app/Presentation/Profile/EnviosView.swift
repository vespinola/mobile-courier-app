//
//  EnviosView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-08.
//

import SwiftUI

struct EnviosView: View {
  var envios: EnviosEntity
  var title: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .fontWeight(.bold)
        .foregroundStyle(.accent)
        .padding(.bottom, 4)
      Group {
        Text(envios.direccion)
        Text(envios.ciudad)
        Text(envios.telefono)
        Text(envios.pais)
      }
      .font(.caption)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding()
  }
}

#Preview {
  EnviosView(
    envios:
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

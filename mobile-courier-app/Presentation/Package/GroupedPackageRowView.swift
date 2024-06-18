//
//  PackageRowView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-16.
//

import SwiftUI

struct GroupedPackageRowView: View {

  var groupedPackage: GroupedPackageEntity

  var body: some View {
    VStack(spacing: 8) {
      HStack(alignment: .top) {
        VStack {
          Text("N° \(groupedPackage.id)")
            .padding(4)
            .foregroundStyle(.white)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.accent)
            )
        }

        Spacer()

        VStack(alignment: .trailing) {
          Text("Gs. \(groupedPackage.cost)")
            .foregroundStyle(.accent)
            .fontWeight(.bold)
          Text("\(groupedPackage.weight) Kg")
        }
      }

      HStack {
        Text(groupedPackage.paquetes.first?.paqueteFechaRetiro ?? "")
          .frame(maxWidth: .infinity, alignment: .leading)

        Spacer()

        Text("\(groupedPackage.paquetes.count) paquetes")
      }

    }
    .frame(maxWidth: .infinity)
    .padding(.init(
      top: 8,
      leading: 16,
      bottom: 8,
      trailing: 16)
    )
    .foregroundStyle(.black)
    .background(
      RoundedRectangle(cornerRadius: 6)
        .fill(Color.surface)
    )
    .clipped()
    .listRowSeparator(.hidden)
    .listRowSpacing(.zero)
    .listRowInsets(.none)
  }
}

#Preview {
  GroupedPackageRowView(
    groupedPackage: .init(
      embarqueCodigo: 2000,
      paquetes: [.mock]
    )
  )
}

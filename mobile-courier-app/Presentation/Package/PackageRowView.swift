//
//  PackageRowView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-16.
//

import SwiftUI

struct PackageRowView: View {

  var groupedPackage: GroupedPackageEntity

  var body: some View {
    VStack(spacing: 8) {
      HStack(alignment: .top) {
        VStack {
          Text("\(groupedPackage.id)")
        }

        Spacer()

        VStack {
          Text("\(groupedPackage.cost)")
          Text("\(groupedPackage.weight)")
        }
      }
      .padding([.leading, .trailing], 16)

//      Text(package.paqueteFechaRetiro)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding([.leading, .trailing], 16)
    }
    .frame(maxWidth: .infinity)
    .foregroundStyle(.white)
    .background(
      RoundedRectangle(cornerRadius: 6)
        .fill(.accent)
    )
    .clipped()
    .padding(16)
  }
}

#Preview {
  PackageRowView(
    groupedPackage: .init(
      embarqueCodigo: 1,
      paquetes: [.mock]
    )
  )
}

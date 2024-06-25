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
        Text("N° \(groupedPackage.formattedId)")
          .roundedIndicator()

        Spacer()

        VStack(alignment: .trailing) {
          Text("Gs \(groupedPackage.formattedTotalCost)")
            .foregroundStyle(.accent)
            .fontWeight(.bold)
          Text("\(groupedPackage.totalWeight) Kg")
        }
      }

      HStack {
        Text(groupedPackage.formattedDate)
          .frame(maxWidth: .infinity, alignment: .leading)

        Spacer()

        Text("\(groupedPackage.packages.count) packages")
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
  }
}

#Preview {
  GroupedPackageRowView(
    groupedPackage: .init(
      shipmentCode: 2000,
      packages: [.mock]
    )
  )
}

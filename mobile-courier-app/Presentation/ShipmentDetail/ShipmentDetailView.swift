//
//  ShipmentDetailView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-19.
//

import SwiftUI

struct ShipmentDetailView: View {

  var groupedPackage: GroupedPackageEntity

  var body: some View {
    VStack {
      getHeader()

      Text("Packages")
        .frame(maxWidth: .infinity, alignment: .leading)

      Divider()
        .background(Color.accent)

      getPackageList()

      Divider()
        .background(Color.accent)

      getFooter()

      Spacer()
    }
    .padding()
    .background(Color.surface)
  }

  @ViewBuilder
  private func getHeader() -> some View {
    HStack(alignment: .top) {
      Text("Shipment #\(groupedPackage.formattedId)")
        .foregroundStyle(Color.accent)
        .fontWeight(.bold)
      Spacer()
      VStack(alignment: .trailing) {
        Image(systemName: "shippingbox.circle")
          .resizable()
          .renderingMode(.template)
          .aspectRatio(1, contentMode: .fit)
          .foregroundStyle(Color.accent)
          .frame(height: 40)
        Text(groupedPackage.formattedDate)
          .font(.caption)
      }
    }
    .padding(.top, 20)
  }

  @ViewBuilder
  private func getPackageList() -> some View {
    List(groupedPackage.packages) { currentPackage in
      HStack {
        VStack(alignment: .leading) {
          Text(currentPackage.packageDescription)
            .fontWeight(.bold)
          Text(currentPackage.packageTrackingNumber)
            .font(.caption)
        }

        Spacer()

        VStack(alignment: .trailing) {
          Text("Gs \(currentPackage.formattedCost)")
            .foregroundStyle(Color.accent)
            .fontWeight(.bold)
          Text("\(currentPackage.packageWeight) Kg")
            .font(.caption)
        }
      }
      .listRowSeparator(.hidden)
      .listRowBackground(EmptyView())
      .listRowInsets(.init())
    }
    .listStyle(.plain)
  }

  @ViewBuilder
  private func getFooter() -> some View {
    HStack {
      Text("Total")
        .fontWeight(.bold)
      Spacer()

      VStack(alignment: .trailing) {
        Text("Gs \(groupedPackage.formattedTotalCost)")
          .foregroundStyle(Color.accent)
          .fontWeight(.bold)
        Text("\(groupedPackage.totalWeight) Kg")
          .font(.caption)
      }
    }
  }
}

#Preview {
  ShipmentDetailView(groupedPackage: .mock)
}

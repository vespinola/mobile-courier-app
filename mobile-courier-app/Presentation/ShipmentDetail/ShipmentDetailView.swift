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
    Text(groupedPackage.formattedId)
  }
}

#Preview {
  ShipmentDetailView(groupedPackage: .mock)
}

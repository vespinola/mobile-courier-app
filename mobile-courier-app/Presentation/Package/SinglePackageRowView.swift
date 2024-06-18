//
//  SinglePackageRowView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-17.
//

import SwiftUI

struct SinglePackageRowView: View {
  var package: PackageEntity

  var body: some View {
    Text(package.paqueteDescripcion)
  }
}

#Preview {
  SinglePackageRowView(package: .mock)
}

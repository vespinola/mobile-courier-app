//
//  PackagePlaceholderView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-15.
//

import SwiftUI

struct PackagePlaceholderView: View {
  var body: some View {
    VStack {
      Image(systemName: "shippingbox.circle.fill")
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .frame(height: 80)
        .foregroundStyle(.accent)
        .padding(.bottom, 8)

      VStack(alignment: .center) {
        Text("You have no packages")
          .padding(.bottom, 4)
          .fontWeight(.bold)
          .foregroundStyle(.accent)
        Text("Your packages will be displayed here when they arrive at your mailbox")
      }
      .multilineTextAlignment(.center)
      .padding(20)
    }
  }
}

#Preview {
  PackagePlaceholderView()
}

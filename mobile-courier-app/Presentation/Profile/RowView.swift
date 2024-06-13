//
//  RowView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-10.
//

import SwiftUI

struct RowView: View {
  var title: String
  var subtitle: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .fontWeight(.bold)
        .foregroundStyle(.accent)
        .padding(.bottom, 4)
      Text(subtitle)
        .font(.caption)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding([.leading, .trailing])
  }
}

#Preview {
  RowView(title: "Document Number", subtitle: "1234567")
}

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
        .padding(.bottom, 2)
      Text(subtitle)
        .font(.caption)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.init(
      top: 8,
      leading: 20,
      bottom: .zero,
      trailing: 20)
    )
  }
}

#Preview {
  RowView(title: "Document Number", subtitle: "1234567")
}

//
//  ToastView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-04.
//

import SwiftUI

struct ToastView: View {
  let message: String

  var body: some View {
    Text(message)
      .frame(maxWidth: .infinity)
      .font(.body)
      .foregroundStyle(.white)
      .padding(
        .init(
          top: 16,
          leading: 20,
          bottom: 16,
          trailing: 20
        )
      )
      .background(Color.accent)
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .padding(.horizontal, 16)

  }
}

#Preview {
  ToastView(message: "Hi toast")
}

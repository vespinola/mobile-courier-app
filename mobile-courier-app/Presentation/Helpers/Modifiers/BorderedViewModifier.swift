//
//  BorderedViewModifier.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

struct BorderedViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
      .background(Color.clear)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(lineWidth: 2)
          .foregroundColor(Color.accentColor.opacity(0.6))
      )
  }
}

extension View {
  func bordered() -> some View {
    ModifiedContent(content: self, modifier: BorderedViewModifier())
  }
}

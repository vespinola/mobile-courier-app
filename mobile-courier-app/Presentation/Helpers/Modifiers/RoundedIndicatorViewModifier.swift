//
//  RoundedIndicatorViewModifier.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-19.
//

import SwiftUI

struct RoundedIndicatorViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(4)
      .foregroundStyle(.white)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .foregroundStyle(.accent)
      )
  }
}

extension View {
  func roundedIndicator() -> some View {
    ModifiedContent(content: self, modifier: RoundedIndicatorViewModifier())
  }
}

//
//  RippleSpinnerModifier.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-25.
//

import SwiftUI

struct RippleSpinnerModifier: ViewModifier {
  @Binding var isLoading: Bool

  func body(content: Content) -> some View {
    if isLoading {
      ZStack {
        content

        if isLoading {
          RippleSpinnerView()
        }
      }
    } else {
      content
    }
  }
}

extension View {
  func showRippleSpinner(isLoading: Binding<Bool>) -> some View {
    self.modifier(RippleSpinnerModifier(isLoading: isLoading))
  }
}

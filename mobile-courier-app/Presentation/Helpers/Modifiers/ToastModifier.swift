//
//  ToastModifier.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-04.
//

import SwiftUI

struct ToastModifier: ViewModifier {
  @Binding var message: String?
  let duration: TimeInterval

  func body(content: Content) -> some View {
    ZStack {
      content

      if let message = message, !message.isEmpty {
        VStack {
          ToastView(message: message)
            .onAppear {
              DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                withAnimation(.easeInOut) {
                  self.message = nil
                }
              }
            }
          Spacer()
        }
        .transition(.move(edge: .top))
      }
    }
  }
}

extension View {
  func toast(message: Binding<String?>, duration: TimeInterval = 2) -> some View {
    self.modifier(ToastModifier(message: message, duration: duration))
  }
}

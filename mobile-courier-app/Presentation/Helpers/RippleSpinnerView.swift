//
//  RippleSpinnerView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-21.
//

import SwiftUI

struct RippleView: View {
  @State private var scale: CGFloat = 0.5
  @State private var opacity: Double = 1.0

  var body: some View {
    Circle()
      .stroke(lineWidth: 10)
      .scaleEffect(scale)
      .foregroundStyle(.accent)
      .opacity(opacity)
      .onAppear {
        let baseAnimation = Animation.easeOut(duration: 1.5)
        withAnimation(baseAnimation.repeatForever(autoreverses: false)) {
          scale = 1.5
          opacity = .zero
        }
      }
  }
}

struct RippleSpinnerView: View {
  var body: some View {
    ZStack {
      ZStack {
        ForEach(0..<3) { i in
          RippleView()
            .animation(
              Animation.easeOut(duration: 1.5)
                .repeatForever(autoreverses: false)
                .delay(Double(i) * 0.3)
            )
        }
        Image("launchIcon")
          .resizable()
          .frame(width: 80, height: 80)
          .aspectRatio(1, contentMode: .fit)
          .clipShape(Circle())
      }
      .frame(width: 100, height: 100)
    }
    .ignoresSafeArea()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
      Color.white.opacity(0.5)
    )
  }
}

#Preview {
  RippleSpinnerView()
}


//
//  HeaderView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-13.
//

import SwiftUI

struct HeaderView: View {
  @EnvironmentObject var appData: AppData

  var body: some View {
    HStack {
      HStack {
        Image("shortLogo")
          .resizable()
          .renderingMode(.template)
          .foregroundStyle(.white)
          .aspectRatio(contentMode: .fit)
          .padding(.init(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: .zero)
          )
          .frame(height: 60)
          .accessibilityHidden(true)
      }

      if let username = appData.username?.capitalized {
        HStack {
          Text("Hi, \(username)!")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .accessibilityIdentifier(
              AccessibilityIdentifiers.HeaderView.usernameLabel
            )
        }
      }

      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(.accent)
  }
}

#Preview {
  let appData = AppData.mock
  appData.username = "John Doe"
  return HeaderView()
    .environmentObject(appData)
}

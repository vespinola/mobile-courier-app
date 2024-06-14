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
    ZStack {
      HStack {
        Image("shortLogo")
          .resizable()
          .renderingMode(.template)
          .foregroundStyle(.white)
          .aspectRatio(contentMode: .fit)
          .padding(16)
          .opacity(0.4)
        Spacer()
      }

      if let username = appData.username?.capitalized {
        HStack {
          Text("Hi, \(username)!")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
          Spacer()
        }
        .padding(.leading, 60)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 60)
    .background(.accent)
  }
}

#Preview {
  let appData = AppData()
  appData.username = "John Doe"
  return HeaderView()
    .environmentObject(appData)
}

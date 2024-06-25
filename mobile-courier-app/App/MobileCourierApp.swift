//
//  mobile_courier_appApp.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

@main
struct MobileCourierApp: App {
  @AppStorage("isDarkMode") var isDarkMode: Bool = false

  @StateObject var coordinator = Coordinator(diContainer: AppDIContainer())
  @StateObject var appData = AppData.shared

  init() {
    UITabBar.appearance().backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
  }

  var body: some Scene {
    WindowGroup {
      CoordinatorRootView()
        .environmentObject(coordinator)
        .environmentObject(appData)
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
  }
}

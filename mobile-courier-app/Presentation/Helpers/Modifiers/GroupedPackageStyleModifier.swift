//
//  GroupedPackageStyleModifier.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-22.
//

import SwiftUI

struct GroupedPackageStyleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .listRowBackground(EmptyView())
      .listRowSeparator(.hidden)
      .listRowSpacing(.zero)
      .listRowInsets(.none)
  }
}

extension View {
  func groupedPackageRowStyle() -> some View {
    self.modifier(GroupedPackageStyleModifier())
  }
}

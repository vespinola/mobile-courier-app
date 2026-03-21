//
//  CourierTextFieldStyle.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

struct CourierTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .frame(minHeight: 35)
      .bordered()
  }
}

//
//  LoginView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

struct LoginView: View {
  public enum Field: Hashable {
    case email
    case password
  }

  @ObservedObject var viewModel: LoginViewModel
  @FocusState private var focusField: Field?
  @EnvironmentObject var coordinator: Coordinator

  public var body: some View {
    ZStack {
      VStack(spacing: 16) {
        Spacer()
        Image("logo")
          .resizable()
          .renderingMode(.template)
          .foregroundStyle(.accent)
          .aspectRatio(contentMode: .fit)
          .padding(.bottom, 16)

        TextField("Email", text: $viewModel.email)
          .focused($focusField, equals: .email)
          .textFieldStyle(CourierTextFieldStyle())
          .keyboardType(.emailAddress)
          .autocorrectionDisabled()
          .autocapitalization(.none)
          .submitLabel(.next)
          .onSubmit {
            focusField = .password
          }

        SecureField("Password", text: $viewModel.password)
          .focused($focusField, equals: .password)
          .textFieldStyle(CourierTextFieldStyle())
          .submitLabel(.done)
          .textContentType(.password)
          .onSubmit {
            focusField = nil
            Task {
              guard await viewModel.doLogin() else { return }
              coordinator.push(.home)
            }
          }

        Toggle("Remember me", isOn: $viewModel.isToggled)
          .onChange(of: viewModel.isToggled) { newValue in
            viewModel.saveUserPreferences(isOn: newValue)
          }
          .disabled(viewModel.email.isEmpty)

        Spacer()

        Button("Log In") {
          Task {
            guard await viewModel.doLogin() else { return }
            coordinator.push(.home)
          }
        }
        .frame(maxWidth: .infinity, minHeight: 44)
        .background(
          viewModel.buttonIsEnabled
          ? .accent
          : .accent.opacity(0.6)
        )
        .foregroundStyle(.white)
        .cornerRadius(16)
        .disabled(!viewModel.buttonIsEnabled)
      }
      .padding(20)

      if viewModel.isLoading {
        RippleSpinnerView()
      }
    }
    .toast(message: $viewModel.toastMessage)
  }
}

#Preview {
  LoginView(
    viewModel: LoginViewModel.previewInstance()
  )
}

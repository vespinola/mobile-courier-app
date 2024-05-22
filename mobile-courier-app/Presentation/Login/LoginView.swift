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

  public var body: some View {
    ZStack {
      VStack(spacing: 16) {
        Spacer()
        Image("logo")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(.red)
          .padding(16)
          .background(.accent)
          .cornerRadius(8)
          .clipped()

        TextField("Correo electrónico", text: $viewModel.email)
          .focused($focusField, equals: .email)
          .textFieldStyle(CourierTextFieldStyle())
          .keyboardType(.emailAddress)
          .autocorrectionDisabled()
          .autocapitalization(.none)
          .submitLabel(.next)
          .onSubmit {
            focusField = .password
          }

        SecureField("Contraseña", text: $viewModel.password)
          .focused($focusField, equals: .password)
          .textFieldStyle(CourierTextFieldStyle())
          .submitLabel(.done)
          .textContentType(.password)
          .onSubmit {
            focusField = nil

            //API CALL
          }

        Toggle("Recordar correo", isOn: $viewModel.isToggled)
          .onChange(of: viewModel.isToggled) { newValue in
            viewModel.saveUserPreferences(isOn: newValue)
          }
          .disabled(viewModel.email.isEmpty)

        Spacer()

        Button("Ingresar") {
          Task {
            await viewModel.doLogin()
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
  }
}

#Preview {
  LoginView(viewModel: LoginViewModel(authRepository: AuthRepository(apiRequestClient: APIRequestClient()), storage: UserDefaultsStorage()))
}


//
//  ProfileViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-06.
//

import Foundation

final class ProfileViewModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var toastMessage: String?
  @Published var addresses: AddressesEntity?

  private lazy var dispatchQueue: DispatchQueue = .main

  private let addressesRepository: AddressRepositoryProtocol

  init(addressesRepository: AddressRepositoryProtocol) {
    self.addressesRepository = addressesRepository

    dispatchQueue.asyncAfter(deadline: .now() + 0.3) {
      Task {
        await self.getAddresses()
      }
    }
  }

  @MainActor
  func getAddresses() async {
    do {
      isLoading = true
      addresses = try await addressesRepository.getAddress()
      isLoading = false
    } catch {
      isLoading = false
      toastMessage = error.localizedDescription
    }
  }
}

//
//  HomeViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-22.
//

import Foundation

final class HomeViewModel: ObservableObject {
  @Published var toastMessage: String?
  @Published var addresses: AddressesEntity?

  private let addressesRepository: AddressRepositoryProtocol

  init(addressesRepository: AddressRepositoryProtocol) {
    self.addressesRepository = addressesRepository
  }

  @MainActor
  func getAddresses() async {
    guard addresses == nil else { return }
    do {
      addresses = try await addressesRepository.getAddress()
    } catch {
      toastMessage = error.localizedDescription
    }
  }
}

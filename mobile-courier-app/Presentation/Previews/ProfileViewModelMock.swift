//
//  ProfileViewModelMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-07.
//

import Foundation

extension ProfileViewModel {
  static func previewInstance() -> ProfileViewModel {
    .init(addressesRepository: AddressesRepositoryMock())
  }
}

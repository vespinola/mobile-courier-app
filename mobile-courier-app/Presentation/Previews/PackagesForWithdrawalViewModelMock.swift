//
//  PackagesForWithdrawalViewModelMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-18.
//

import Foundation

extension PackagesForWithdrawalViewModel {
  static func previewInstance() -> PackagesForWithdrawalViewModel {
    .init(packagesRepository: PackagesRepositoryMock())
  }
}

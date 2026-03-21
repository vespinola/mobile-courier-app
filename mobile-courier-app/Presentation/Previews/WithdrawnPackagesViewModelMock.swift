//
//  PackagesViewModelMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-16.
//

import Foundation

extension WithdrawnPackagesViewModel {
  static func previewInstance() -> WithdrawnPackagesViewModel {
    .init(packagesRepository: PackagesRepositoryMock())
  }
}

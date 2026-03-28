//
//  ViewModelFactory.swift
//  mobile-courier-app
//
//  Created by Assistant on 2026-03-28.
//

import Foundation

public struct ViewModelFactory {
  public let makeLoginViewModel: () -> LoginViewModel
  public let makeHomeViewModel: () -> HomeViewModel
  public let makePackagesForWithdrawalViewModel: () -> PackagesForWithdrawalViewModel
  public let makeWithdrawnPackagesViewModel: () -> WithdrawnPackagesViewModel
  public let makeSettingsViewModel: () -> SettingsViewModel

  public init(
    makeLoginViewModel: @escaping () -> LoginViewModel,
    makeHomeViewModel: @escaping () -> HomeViewModel,
    makePackagesForWithdrawalViewModel: @escaping () -> PackagesForWithdrawalViewModel,
    makeWithdrawnPackagesViewModel: @escaping () -> WithdrawnPackagesViewModel,
    makeSettingsViewModel: @escaping () -> SettingsViewModel
  ) {
    self.makeLoginViewModel = makeLoginViewModel
    self.makeHomeViewModel = makeHomeViewModel
    self.makePackagesForWithdrawalViewModel = makePackagesForWithdrawalViewModel
    self.makeWithdrawnPackagesViewModel = makeWithdrawnPackagesViewModel
    self.makeSettingsViewModel = makeSettingsViewModel
  }
}

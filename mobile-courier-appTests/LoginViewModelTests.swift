//
//  LoginViewModelTests.swift
//  mobile-courier-appTests
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import XCTest
@testable import mobile_courier_app

final class LoginViewModelTests: XCTestCase {
  private var storageSpy: StorageSpy!
  private var authRepoSpy: AuthRepositorySpy!
  private var sut: LoginViewModel!

  @MainActor
  override func setUpWithError() throws {
    try super.setUpWithError()

    storageSpy = StorageSpy()
    authRepoSpy = AuthRepositorySpy()

    sut = LoginViewModel(authRepository: authRepoSpy, storage: storageSpy)
  }

  override func tearDownWithError() throws {
    storageSpy = nil
    authRepoSpy = nil

    sut = nil

    try super.tearDownWithError()
  }

  func testLoadingState() async {
    await sut.doLogin()
    XCTAssertTrue(authRepoSpy.performLoginCalled)
  }

  func testStorage() async {
    await sut.saveUserPreferences(isOn: true)
    XCTAssertTrue(storageSpy.setStringCalled)
    await sut.saveUserPreferences(isOn: false)
    XCTAssertTrue(storageSpy.deleteCalled)
  }
}

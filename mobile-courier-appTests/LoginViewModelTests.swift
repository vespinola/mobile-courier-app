//
//  LoginViewModelTests.swift
//  mobile-courier-appTests
//
//  Migrated to Swift Testing
//


import Testing
@testable import mobile_courier_app

@Suite("LoginViewModel Tests")
struct LoginViewModelTests {
    @Test("Loading state triggers auth and storage")
    @MainActor
    func loadingState() async throws {
        // Arrange
        let storageSpy = StorageSpy()
        let authRepoSpy = AuthRepositorySpy()
        let sut = LoginViewModel(authRepository: authRepoSpy, storage: storageSpy)

        // Act
        _ = await sut.doLogin()

        // Assert
        #expect(authRepoSpy.performLoginCalled)
        #expect(storageSpy.setStringCalled)
    }
}

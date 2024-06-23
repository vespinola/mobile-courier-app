//
//  AuthRepository.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-20.
//

import Foundation

struct AuthRepository: AuthRepositoryProtocol {
  private var apiRequestClient: APIRequestClientProtocol

  init(apiRequestClient: APIRequestClientProtocol = APIRequestClient()) {
    self.apiRequestClient = apiRequestClient
  }

  func performLogin(email: String, password: String) async throws {
//    let model: LoginModel = try await apiRequestClient.performRequest(
//      endpoint: AuthEndpoints.login(email: email, password: password),
//      decoder: JSONDecoder()
//    )

    let model = LoginEntity(username: "vladimir.espinola@gmail.com", accessToken: "eyJhbGciOiJIUzI1NiJ9.eyJwcmluY2lwYWwiOiJINHNJQUFBQUFBQUFBSlZTejJzVFFSUitpU2tWaXRnV0ZFUXFIdXBOTmpZaE5DR1gybEtsc0NSaXpLV0NaYkw3c2s0N083UE96S2FiaThTTFBYZ1ExSUxneFlNbjZYXC9peVQ5QUVPODk5K3FidE0ybVhvckx3aTV2dnYxK3ZUMDZoaG1qb1JwcHhvWHhFcEZHWEhvbTBWeEdCb05VY3p2MFVvTTZSRHRHUEI0RHV6U0IwNnRRaElJUFJSNWFXUFIzMllDVkJaTlJ1ZDNieGNBMk13MFZwYU16eHI1bU1lNHJ2ZWROdUFPbDhZSkFUbDFZSzhMc05peXdJRkNwdEMwbE43T0Vhd3kzWVQ2ZitTclljNk1iQVoyZ3RKd0pNdzJkUmNsNkFrTWY1bGhxWHlwUzVXZ3NYRDgxbTFvdXloMjBUUit1SnN3WWN2ZFBrbzUxMXQyNXN5a3B3U3Q0RGFVc0tkQkYzZDF6VU1cL3hlQnRLQ0VyTmxUVExYUm1ya1BlNUV5ZiswZEtIbisrXC9qTHBGQU9ya1wvdVhmNVBOYjZ6RDY4ZUxrenJqb1FtRGg1cFQxSE5iTUVuS3prRE1cLzAraVVmMzErOHZIdytPRDVGVkoyaUVmXC92NFwvbGgyZk5EVGRVbkRETnJKcmFFZEh1bDl3N2thOWZUbjYraGFIWDRYRWlrUDRvYVRHY1NPVEVGTGVrbFRqdjI4SzFwMjFcL2M2ZlYzbkhQVG1iaGJyOGZybFRweGxWV2J6UjZyRjZyWTZOU3FmYnJxMkd0aGc4czNCNElGdktZYXc5TndxVVNiQzJLS1JtWmlTZDl1VVY3VzJRalFyMzQ1K3Uza3pjSGRkTGZncGtCRXluU3h1WnpYQ3VOZTZqZkhoMHV6WDM2XC9XNmNIOERcL1wvaGNLbEMyeFN3TUFBQT09Iiwic3ViIjoidmxhZGltaXIuZXNwaW5vbGFAZ21haWwuY29tIiwiZXhwIjoxNzI0NTQxOTQ3LCJpYXQiOjE3MTg0OTM5NDcsInJvbGVzIjpbIlJPTEVfTk9fUk9MRVMiXX0._SSqulgIqcM0GabBT7oSULFsWEgiFGQKDGDpVKdFy3U")

    AppData.shared.updateToken(model.accessToken)
  }
}

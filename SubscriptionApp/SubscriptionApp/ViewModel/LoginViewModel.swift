//
//  LoginViewModel.swift
//  SubscriptionApp
//
//  Created by Abishek on 26/04/26.
//

import Foundation
import Combine


class LoginViewModel: ObservableObject {
    @Published var selectedCountry: Country = .uk
    @Published var phoneNumber: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var navigateToPlans: Bool = false
    @Published var showCountryPicker: Bool = false
 
    var canSubmit: Bool {
        phoneNumber.count == 10
    }
 
    func getOTP() async {
        guard canSubmit else {
            errorMessage = "Please enter a valid 10-digit number."
            return
        }
        isLoading = true
        errorMessage = nil
        try? await Task.sleep(nanoseconds: 800_000_000)
        isLoading = false
        navigateToPlans = true
    }
}

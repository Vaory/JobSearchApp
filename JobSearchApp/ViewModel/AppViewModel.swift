//
//  LoginViewModel.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 05.04.2024.
//

import Foundation

class AppViewModel: ObservableObject {
    
    @Published var emailAdressText: String = ""
    @Published var isVerifyed = true
    
    func emailValidation(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

//
//  ValidEmail.swift
//  Figma
//
//  Created by Kirill Dev on 22.03.2023.
//

import Foundation

//MARK: - Valid Email

func isValidEmail(emailID: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: emailID)
}

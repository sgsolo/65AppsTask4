//
//  ValidationService.swift
//  65AppsTask4
//
//  Created by Григорий Соловьев on 11.03.2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import Foundation

protocol ValidationService {
    func validate(login: String) -> Bool
}

struct ValidationServiceImp: ValidationService {
    let emailRegularExpression = try? NSRegularExpression(pattern: "^[A-Z0-9.-]+@[A-Z0-9.-]+\\.[A-Za-z]{2,6}$", options: NSRegularExpression.Options.caseInsensitive)
    
    let nickNameRegularExpression = try? NSRegularExpression(pattern: "^[A-Z]([A-Z0-9-.]){2,31}$", options: NSRegularExpression.Options.caseInsensitive)
    
    func validate(login: String) -> Bool {
        if self.validation(text: login, regularExpression: emailRegularExpression) ||
            self.validation(text: login, regularExpression: nickNameRegularExpression){
            return true
        } else {
            return false
        }
    }
    
    private func validation(text: String, regularExpression: NSRegularExpression?) -> Bool {
        if let nickNameResult = regularExpression?.numberOfMatches(in: text, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: text.count)),
            nickNameResult != 0 {
            return true
        } else {
            return false
        }
    }
    
}

//
//  ValidationServiceTest.swift
//  65AppsTask4
//
//  Created by Григорий Соловьев on 11.03.2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import XCTest
@testable import Task4

class ValidationServiceTest: XCTestCase {

    let validationService: ValidationService = ValidationServiceImp()
    
    override func setUp() {
    }

    override func tearDown() {
    }

    func testValidNickName() {
        var login = "qwert.1"
        XCTAssertEqual(validationService.validate(login: login), true)
        login = "qweqweqweq-weq"
        XCTAssertEqual(validationService.validate(login: login), true)
    }
    
    func testNotValidNickName() {
        var login = "test@"
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "test@com"
        XCTAssertEqual(validationService.validate(login: login), false)
    }
    
    func testValidEmail() {
        var email = "sgsolossdsd@yandex.com"
        XCTAssertEqual(validationService.validate(login: email), true)
        email = "sgsolossdsd@mail.ru"
        XCTAssertEqual(validationService.validate(login: email), true)
    }
    
    func testNotValidEmail() {
        var email = "qwe@com"
        XCTAssertEqual(validationService.validate(login: email), false)
        email = "qwe@com@qwe"
        XCTAssertEqual(validationService.validate(login: email), false)
    }
    
    func testLoginMaxLenght() {
        var login = "o123456789012345678901234567890qw"
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "o123456789012345678901234567890qwqwe"
        XCTAssertEqual(validationService.validate(login: login), false)
    }
    
    func testLoginMinLenght() {
        var login = ""
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "q"
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "qq"
        XCTAssertEqual(validationService.validate(login: login), false)
    }
    
    func testCheckFirstSymbol() {
        var login = ".eqweqwe"
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "-qweqrqwr"
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "1assdfsdf"
        XCTAssertEqual(validationService.validate(login: login), false)
    }
    
    func testCheckLocale() {
        var login = "йуцйцуй"
        XCTAssertEqual(validationService.validate(login: login), false)
        login = "qweqewйу"
        XCTAssertEqual(validationService.validate(login: login), false)
    }
}

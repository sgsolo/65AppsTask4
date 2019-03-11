//
//  ViewController.swift
//  65AppsTask4
//
//  Created by Григорий Соловьев on 11.03.2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let validationService: ValidationService = ValidationServiceImp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Actions
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if let login = sender.text, validationService.validate(login: login) {
            sender.textColor = .black
        } else {
            sender.textColor = .red
        }
    }
}

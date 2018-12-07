//
//  RegistrationViewModel.swift
//  TrueLove
//
//  Created by Harry on 08/12/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit

class RegistrationViewModel {
    var fullName: String? {
        didSet {
            checkFormValidity()
        }
    }
    
    var email: String? {
        didSet {
            checkFormValidity()
        }
    }
    
    var password: String? {
        didSet {
            checkFormValidity()
        }
    }
    
    fileprivate func checkFormValidity() {
        let isFormValid = fullName?.isEmpty == false && email?.isEmpty == false && password?.isEmpty == false
        isFromValidObserver?(isFormValid)
    }
    
    var isFromValidObserver: ((Bool) -> ())?
}

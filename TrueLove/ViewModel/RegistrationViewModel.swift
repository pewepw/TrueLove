//
//  RegistrationViewModel.swift
//  TrueLove
//
//  Created by Harry on 08/12/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit

class RegistrationViewModel {
    
    var bindableImage = Bindable<UIImage>()
    
//    var image: UIImage? {
//        didSet {
//            imageObserver?(image)
//        }
//    }
//
//    var imageObserver: ((UIImage?) -> ())?
    
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
        bindableIsFormValid.value = isFormValid
    }
    
    var bindableIsFormValid = Bindable<Bool>()
    
//    var isFromValidObserver: ((Bool) -> ())?
}

//
//  Bindable.swift
//  TrueLove
//
//  Created by Harry on 08/12/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) ->()) {
        self.observer = observer
    }
}

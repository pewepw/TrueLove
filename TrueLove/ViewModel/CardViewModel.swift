//
//  CardViewModel.swift
//  TrueLove
//
//  Created by Harry on 14/11/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit

protocol ProduceCardViewModel {
    func toCardViewModel() -> CardViewModel
}

struct CardViewModel {
    let imageName: String
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
}


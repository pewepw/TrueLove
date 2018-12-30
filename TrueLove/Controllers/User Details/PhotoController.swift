//
//  PhotoController.swift
//  TrueLove
//
//  Created by Harry on 30/12/2018.
//  Copyright © 2018 Harry Ng. All rights reserved.
//

import UIKit

class PhotoController: UIViewController {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "KimMinHee3"))
    
    init(imageUrl: String) {
        if let url = URL(string: imageUrl) {
            imageView.sd_setImage(with: url)
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
    }
}

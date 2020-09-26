//
//  IBDesignInspect.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

// MARS: - IMV

@IBDesignable class RoImageView: UIImageView {
    
    @IBInspectable var cRadio: CGFloat = 5.56 {
        didSet {
            self.layer.cornerRadius = cRadio
        }
    }
}

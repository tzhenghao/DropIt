//
//  DropItViewController.swift
//  DropIt
//
//  Created by Zheng Hao Tan on 7/10/15.
//  Copyright (c) 2015 Zheng Hao Tan. All rights reserved.
//

import UIKit

class DropItViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
    
    var dropsPerRow = 10
    
    var dropSize: CGSize {
        let size = gameView.bounds.size.width / CGFloat(dropsPerRow)
        
        return CGSize(width: size, height: size)
    }
}

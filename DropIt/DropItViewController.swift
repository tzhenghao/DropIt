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
    
    let gravity = UIGravityBehavior()
    
    lazy var animator: UIDynamicAnimator = {
        let lazilyCreatedDynamicAnimator = UIDynamicAnimator(referenceView: self.gameView)
        return lazilyCreatedDynamicAnimator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
    }

    var dropsPerRow = 10
    
    var dropSize: CGSize {
        let size = gameView.bounds.size.width / CGFloat(dropsPerRow)
        
        return CGSize(width: size, height: size)
    }
    @IBAction func drop(sender: UITapGestureRecognizer) {
        drop()
    }
    
    func drop() {
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        
        let dropView = UIView(frame: frame)
        dropView.backgroundColor = UIColor.random
        
        gameView.addSubview(dropView)
        
        gravity.addItem(dropView)
    }
}

private extension CGFloat {
    static func random(max:Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
}

// Extension for random UIColor colors.
private extension UIColor {
    class var random: UIColor {
        
        switch arc4random() % 6 {
            case 0: return UIColor.greenColor()
            case 1: return UIColor.blueColor()
            case 2: return UIColor.redColor()
            case 3: return UIColor.orangeColor()
            case 4: return UIColor.purpleColor()
            case 5: return UIColor.yellowColor()
            default: return UIColor.blackColor()
        }
    }
}

//
//  DropItBehavior.swift
//  DropIt
//
//  Created by Zheng Hao Tan on 7/11/15.
//  Copyright (c) 2015 Zheng Hao Tan. All rights reserved.
//

import UIKit

class DropItBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
        }()
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedDropBehavior = UIDynamicItemBehavior()
        lazilyCreatedDropBehavior.allowsRotation = false
        lazilyCreatedDropBehavior.elasticity = 0.75
        
        return lazilyCreatedDropBehavior
    }()

    override init() {
        super.init()
        
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dropBehavior)
    }
    
    func addDrop(drop: UIView) {
        
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
        dropBehavior.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        
        gravity.removeItem(drop)
        collider.removeItem(drop)
        dropBehavior.removeItem(drop)
        drop.removeFromSuperview()
    }
}

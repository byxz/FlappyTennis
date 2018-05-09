//
//  size.swift
//  game
//
//  Created by Mac on 28.04.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//
import UIKit


extension UIView {
    
    var rightSideX: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    var leftSideX: CGFloat {
        return self.frame.origin.x
    }
    
    var upSideX: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    var downSideX: CGFloat {
        return self.frame.origin.y
    }
    
    //
    // Функция
    // 
    func createFireBall() -> UIImageView {
        
        let sizeBall = (wight: 40, height: 40)
        let createPoint = (x: 100, y: 100)
        let rect = CGRect(x: createPoint.x, y: createPoint.y, width: sizeBall.wight, height: sizeBall.height)
        
        let fireBall = UIImageView(frame: rect)
        fireBall.image = UIImage(named: "fire")!
        fireBall.layer.cornerRadius = 1
        
        return fireBall
    }
    
    
}

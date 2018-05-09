//
//  Background.swift
//  game
//
//  Created by Mac on 09.05.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import UIKit

class Cloud: UIImageView {
    
    static func addCloud(view: UIView) -> Cloud {
        
        let sizeCloud = (width: 130, height: 50)
        
        let rect = CGRect(x: Int(view.frame.width - 20), y: 1, width: sizeCloud.width, height: sizeCloud.height)
        let cloud = Cloud(frame: rect)
        
        cloud.image = UIImage(named: "cloud")
        view.addSubview(cloud)
        return cloud
    }
    
    func move() {
        let view = superview!
        let random = arc4random_uniform(UInt32(view.frame.height - 100))
        
        if rightSideX < view.frame.minX {
            self.frame.origin.x = view.frame.width
            self.frame.origin.y = CGFloat(random)
        } else {
            self.frame.origin.x -= 0.5
        }
    }
    
    func add(to view: UIView) {
        view.addSubview(self)
    }
}

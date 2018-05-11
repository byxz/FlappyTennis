//
//  rocket.swift
//  game
//
//  Created by Mac on 26.04.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import UIKit

class Rocket: UIImageView {
    
    var movingDirectionForRocketLeft: Direction = .up
    var movingDirectionForRocketRight: Direction = .down
    
    enum rocketType {
        case left
        case right
    }
    
    static func addRocket(view: UIView, type: rocketType) -> Rocket {
        
        var rect = CGRect()
        let sizeRocket = (wight: 80, height: 15)
        
        switch type {
        case .left:
            rect = CGRect(x: -5, y: 1, width: sizeRocket.wight, height: sizeRocket.height)
        case .right:
            rect = CGRect(x: Int(view.frame.width - CGFloat(sizeRocket.wight)), y: Int(view.frame.height - CGFloat(sizeRocket.height)), width: sizeRocket.wight, height: sizeRocket.height)
        }
        
        
        let rocket = Rocket(frame: rect)
        rocket.image = UIImage(named: "rocket")
        rocket.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        view.addSubview(rocket)
        return rocket
    }
    
    func move(rocket: Rocket) {
        
        let view = superview!
        switch rocket {
        case rocketLeft:
            if movingDirectionForRocketLeft == .up && rocket.upSideX < view.frame.size.height {
                rocket.frame.origin.y += 1
                if rocket.upSideX >= view.frame.size.height {
                    movingDirectionForRocketLeft = .down
                }
            } else {
                rocket.frame.origin.y -= 1
                if rocket.downSideX <= 0  {
                    movingDirectionForRocketLeft = .up
                }
            }
        case rocketRight:
            if movingDirectionForRocketRight == .up && rocket.upSideX < view.frame.size.height {
                rocket.frame.origin.y += 1
                if rocket.upSideX >= view.frame.size.height {
                    movingDirectionForRocketRight = .down
                }
            } else {
                rocket.frame.origin.y -= 1
                if rocket.downSideX <= 0  {
                    movingDirectionForRocketRight = .up
                }
            }
        default:
            print("Hello Word")
        }
    }
    
    func intersectionWithRockets(view: Bird) {
        if (view.frame.intersects(rocketRight.frame)) {
            view.direction = .left
        } else if (view.frame.intersects(rocketLeft.frame)){
            view.direction = .right
        }
    }
    
    
    func add(to view: UIView) {
        view.addSubview(self)
    }
}

//
//  bird.swift
//  game
//
//  Created by Mac on 26.04.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import UIKit

class Bird: UIImageView {
    
    var direction: Direction = .right
    
    private lazy var arrayOfBall: [UIImageView] = {
        
        var arrayOfBall: [UIImageView] = []
        for i in 0..<10 {
            arrayOfBall.append(createFireBall())
        }
        return arrayOfBall
    }()
    
    static func addBird(view: UIView) -> Bird {
        
        let rect = CGRect(x: 100, y: 100, width: 50, height: 50)
        let bird = Bird(frame: rect)
        
        var images: [UIImage] = []
        for i in 1...3 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
        
        bird.animationImages = images
        bird.animationDuration = 0.5
        bird.animationRepeatCount = -1
        bird.contentMode = .scaleAspectFit
        bird.startAnimating()
        view.addSubview(bird)
        return bird
    }
    
    func add(to view: UIView) {
        view.addSubview(self)
    }
    
    func move() {
        let view = superview!
        
        if direction == .right && rightSideX < view.frame.size.width {
            frame.origin.x += 1
            if rightSideX >= view.frame.size.width {
                direction = .left
            }
            transform = CGAffineTransform(scaleX: 1, y: 1)
        } else {
            frame.origin.x -= 1
            if leftSideX <= 0 {
                direction = .right
            }
            transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    func fire(completion: (Int) -> Void) {
        if arrayOfBall.isEmpty {
            print("Error")
            print("Нет залпов")
            return
        }
        let ball = arrayOfBall.last
        self.arrayOfBall.removeLast()
        completion(arrayOfBall.count)
        ball?.frame.origin.x = 50
        //print(closure(arrayOfBall.count))
        
        UIView.animate(withDuration: 1, animations: {
            ball?.frame.origin.x = 100
        }) { (finished: Bool) in
            ball?.removeFromSuperview()
        }
        addSubview(ball!)
    }
}

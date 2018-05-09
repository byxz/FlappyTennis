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
    
    
    let closure = {
       
    }
    
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
    
    func fire(array: [Bird] ) -> String {
        
        if array.isEmpty {
            print("Error")
        } else {
            addSubview(self)
        }
        return "Осталось \(array.count) залп(ов)"
    }
    
    //
    //Функция удалить
    //
    
    
    func addArrayBall() -> [UIImageView] {
        var fireBall: [UIImageView] = []
        
        for _ in 0...10 {
            fireBall.append(createFireBall())
        }
        return fireBall
    }
}






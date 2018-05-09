//
//  ViewController.swift
//  game
//
//  Created by Mac on 26.04.2018.
//  Copyright © 2018 testOrg. All rights reserved.
//

import UIKit

var rocketLeft: Rocket!
var rocketRight: Rocket!

class ViewController: UIViewController {
    
    var bird: Bird!
    var timer: Timer!
    var fire: Bird!
    var cloud: Cloud!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
        runTimer()
    }
    
    func setupScene() {
        view.backgroundColor = #colorLiteral(red: 0.1844131092, green: 0.9754205244, blue: 1, alpha: 1)
        
        bird = Bird.addBird(view: view)
        bird.add(to: view)
        rocketRight = Rocket.addRocket(view: view, type: Rocket.rocketType.right)
        rocketRight.add(to: view)
        rocketLeft = Rocket.addRocket(view: view, type: Rocket.rocketType.left)
        rocketLeft.add(to: view)
        cloud = Cloud.addCloud(view: view)
        cloud.add(to: view)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.007, repeats: true, block: { _ in
            self.timerTick()
        })
    }
    
    func timerTick() {
        bird.move()
        cloud.move()
        rocketLeft.move(rocket: rocketLeft)
        rocketRight.move(rocket: rocketRight)
        rocketLeft.intersectionWithRockets(view: bird)
        rocketRight.intersectionWithRockets(view: bird)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //bird.direction = bird.direction == .right ? .left : .right
        bird.fire()
    }
}

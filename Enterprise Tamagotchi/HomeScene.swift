//
//  HomeScene.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

let gameSpeed:Double = 10

class HomeScene : SKScene, TamagotchiDelegate {
    private var stateMachine: GKStateMachine!
    var previousUpdateTime = TimeInterval(0)
    let tamagotchi = Tamagotchi()
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        let sincePreviousUpdate = currentTime - previousUpdateTime
        if sincePreviousUpdate >= 1/gameSpeed {
            stateMachine.update(withDeltaTime: sincePreviousUpdate)
            previousUpdateTime = currentTime
        }
    }
    
    override func didMove(to view: SKView) {
        tamagotchi.delegate = self
        
        stateMachine = GKStateMachine(states: [AsleepState(home: self, tamagotchi:tamagotchi),
                                               ActiveState(home: self, tamagotchi:tamagotchi),
                                               TakingMealState(home: self, tamagotchi:tamagotchi),
                                               DeadState(home: self, tamagotchi:tamagotchi)])
        
        stateMachine.enterState(ActiveState.self)
    }
    
    func handleTouchInScene(touch: CGPoint) {
        let sleepButton = childNode(withName: "//sleepButton")
        let playButton = childNode(withName: "//activityButton")
        let eatButton = childNode(withName: "//eatButton")
        
        if atPoint(touch) === sleepButton {
            attemptToGoSleep()
        } else if atPoint(touch) === playButton {
            attemptToPlay()
        } else if atPoint(touch) === eatButton {
            attemptToTakeMeal()
        }
    }
    
    func attemptToGoSleep() {
        stateMachine.enterState(AsleepState.self)
    }
    
    func attemptToPlay() {
        stateMachine.enterState(ActiveState.self)
    }
    
    func attemptToTakeMeal() {
        stateMachine.enterState(TakingMealState.self)
    }
    
    func tamagotchiDied(tamagotchi: Tamagotchi) {
        stateMachine.enterState(DeadState.self)
        
        let alertController = UIAlertController(title: "DEAD", message: "all tamagotchi is dead", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        UIApplication.shared().keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocationInView = touches.first!.location(in: view)
        let touchLocationInScene = convertPoint(fromView: touchLocationInView)
        handleTouchInScene(touch: touchLocationInScene)
    }
}

//
//  HomeScene.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class HomeScene : SKScene {
    
    private var stateMachine: GKStateMachine!
    
    override func didMove(to view: SKView) {
        stateMachine = GKStateMachine(states: [SleepyState(home: self),
                                               AsleepState(home: self),
                                               WakingUpState(home: self),
                                               AwakeState(home: self),
                                               HungryState(home: self),
                                               PrepareForMealState(home: self),
                                               TakingMealState(home: self),
                                               FinishingMealState(home: self)])
        
        stateMachine.enterState(AwakeState.self)
    }
    
    func handleTouchInScene(touch: CGPoint) {
        let sleepButton = childNode(withName: "//sleepButton")
        let wakeUpButton = childNode(withName: "//wakeUpButton")
        let eatButton = childNode(withName: "//eatButton")
        
        if atPoint(touch) === sleepButton {
            attemptToGoSleep()
        } else if atPoint(touch) === wakeUpButton {
            attemptToWakeUp()
        } else if atPoint(touch) === eatButton {
            attemptToTakeMeal()
        }
    }
    
    func attemptToGoSleep() {
        stateMachine.enterState(SleepyState.self)
    }
    
    func attemptToWakeUp() {
        stateMachine.enterState(WakingUpState.self)
    }
    
    func attemptToTakeMeal() {
        stateMachine.enterState(PrepareForMealState.self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocationInView = touches.first!.location(in: view)
        let touchLocationInScene = convertPoint(fromView: touchLocationInView)
        handleTouchInScene(touch: touchLocationInScene)
    }
}

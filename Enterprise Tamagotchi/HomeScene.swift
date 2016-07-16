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
                                               SleepState(home: self),
                                               WakingUpState(home: self),
                                               AwakeState(home: self)])
        
        stateMachine.enterState(AwakeState.self)
    }
    
    func handleTouchInScene(touch: CGPoint) {
        let goSleepButton = childNode(withName: "//goSleepButton")
        
        if atPoint(touch) === goSleepButton {
            attemptToGoSleep()
        } else {
            attemptToWakeUp()
        }
    }
    
    func attemptToGoSleep() {
        stateMachine.enterState(SleepyState.self)
    }
    
    func attemptToWakeUp() {
        stateMachine.enterState(WakingUpState.self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocationInView = touches.first!.location(in: view)
        let touchLocationInScene = convertPoint(fromView: touchLocationInView)
        handleTouchInScene(touch: touchLocationInScene)
    }
}

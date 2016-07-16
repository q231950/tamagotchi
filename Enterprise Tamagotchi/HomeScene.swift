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
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var stateMachine: GKStateMachine!
    
    override func didMove(to view: SKView) {
        stateMachine = GKStateMachine(states: [SleepyState(home: self),
                                               SleepState(home: self),
                                               WakingUpState(home: self),
                                               AwakeState(home: self)])
        
        stateMachine.enterState(AwakeState.self)
    }
}

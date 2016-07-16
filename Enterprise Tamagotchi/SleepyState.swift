//
//  SleepyState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class SleepyState : TamagotchiState {
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "SleepyState")
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "sleepy")
        
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.after(when: dispatchTime, execute: {
            self.stateMachine?.enterState(SleepState.self)
        })
    }
    
}

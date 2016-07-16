//
//  AwakeState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class AwakeState : TamagotchiState {
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "AwakeState")
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "awake")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass === SleepyState.self
    }
}

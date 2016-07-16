//
//  AsleepState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import SpriteKit
import GameplayKit

class AsleepState : TamagotchiState {
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "AsleepState")
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "asleep")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass === WakingUpState.self
    }
}

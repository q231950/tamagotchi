//
//  DeadState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 24/07/2016.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import GameKit

class DeadState: TamagotchiState {
    required init(home: HomeScene, tamagotchi: Tamagotchi) {
        super.init(home: home, tamagotchi: tamagotchi, associatedNodeName: "deadIcon")
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "dead")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return false
    }
}

//
//  HungryState.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 16.07.16.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import GameplayKit

class HungryState: TamagotchiState {
    
    required init(home: HomeScene) {
        super.init(home: home, associatedNodeName: "HungryState")
    }
    
    override func didEnter(withPreviousState previousState: GKState?) {
        super.didEnter(withPreviousState: previousState)
        
        updateFeeling(feeling: "hungry")
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass === PrepareForMealState.self
    }
}

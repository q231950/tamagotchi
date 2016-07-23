//
//  Tamagotchi.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 22/07/2016.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

class Tamagotchi {
    let sleep = Level()
    let activity = Level()
    let repletion = Level()
    
    func increase(level: Level) {
        if level === sleep {
            sleep.level += 1
            activity.level -= 1
        } else if level === activity {
            activity.level += 1
            repletion.level -= 1
        } else if level === repletion {
            repletion.level += 1
            sleep.level -= 1
        }
    }
}

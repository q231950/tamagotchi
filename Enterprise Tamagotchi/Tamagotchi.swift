//
//  Tamagotchi.swift
//  Enterprise Tamagotchi
//
//  Created by Martin Kim Dung-Pham on 22/07/2016.
//  Copyright © 2016 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation
import UIKit

class Tamagotchi : LevelCoordinator {
    let sleep = Level()
    let activity = Level()
    let repletion = Level()
    
    init() {
        sleep.levelCoordinator = self
        activity.levelCoordinator = self
        repletion.levelCoordinator = self
    }
    
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
    
    func reachedLethalLevel(level: Level) {
        sleep.freeze()
        activity.freeze()
        repletion.freeze()
        
        let alertController = UIAlertController(title: "DEAD", message: "all tamagotchi is dead", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        UIApplication.shared().keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

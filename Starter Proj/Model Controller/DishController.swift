//
//  DishController.swift
//  Starter Proj
//
//  Created by Alex Thompson on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class DishController {
    
    var dish: [Dish] = []
    
    
    var testDish: [Dish] = [Dish(name: "Taco", type: "Mexican"),
                            Dish(name: "Alfredo", type: "Italian")]
    
    func createNewDish(name: String, type: String) {
        let dishes = Dish(name: name, type: type)
        dish.append(dishes)
    }
    
    func removeDish(name: Dish) {
        if let index = dish.firstIndex(of: name) {
            dish.remove(at: index)
        }
    }
    
//    func updateDish(myDish: Dish, withName name: String, type: String) {
//        guard let index = dish.firstIndex(of: myDish) else { return }
//
//        var newDish = myDish
//
//        newDish.name = name
//        newDish.type = type
//
//        dish.remove(at: index)
//        dish.insert(newDish, at: index)
//    }
}

//
//  Meal.swift
//  FoodTracker
//
//  Created by Stephen Dodd on 13/02/2017.
//  Copyright © 2017 Stephen Dodd. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialisation
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        
        // Initialisation should fail if there is no name or if the rating is negative.
            
        //Name must not be empty
        
        guard !name.isEmpty else {
            return nil
        }
        
        //The rating must be between 0 and 5 inclusively
        
        guard rating >= 0 && rating<=5 else {
            return nil
        }
        
        //MARK: Initialise stored properties
        
        self.name = name
        self.photo = photo
        self.rating = rating

    }

}

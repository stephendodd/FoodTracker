//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Stephen Dodd on 30/01/2017.
//  Copyright © 2017 Stephen Dodd. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal class tests
    
    //Confirm that the meal initialiser returns a Meal object when passed valid parameters
    
    func testMealInitialisationSucceeds() {
        //Lowest possible rating zero
        let zeroRatingMeal = Meal.init(name:"Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Highest positive rating five
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    //Confirm that the meal initialiser returns nil when passes a negative rating
    
    func testMealInitialisationFails(){
        
        //Negative rating should fail
        let negativeRatingMeal = Meal.init(name: "NegativeRating", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //Empty name string should fail
        let emptyNameMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyNameMeal)
        
        //Rating exceeds maximum
        let maximumRatingMeal = Meal.init(name:"MaximumRatingExceeded", photo: nil, rating: 6)
        XCTAssertNil(maximumRatingMeal)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

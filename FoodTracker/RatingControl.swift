//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Stephen Dodd on 3/02/2017.
//  Copyright © 2017 Stephen Dodd. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44, height: 44) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialisation
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("the button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            //If the selected rating equals the current rating, set the rating to zero
            rating = 0
        } else {
            
            //Otherwise set the rating to the selected rating
            rating = selectedRating
            
        }
        
    }
    
    //MARK: Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for index in 0..<starCount {
            // Create a button
            let button = UIButton()
            
            //Set the button images
            
            button.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
            button.setImage(#imageLiteral(resourceName: "filledStar"), for: .selected)
            button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .highlighted)
            button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: [.highlighted, .selected])
            
            //Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            //Setup the button action
            
            button.addTarget(self, action:#selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //Add the button to the stack
            
            addArrangedSubview(button)
            
            //Add the new button to the rating button array
            
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            //If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            //Set the hint string for the currently selected star
            let hintString: String?
            
            if rating == index + 1 {
                hintString = "tap to reset the rating to zero."

            } else {
                hintString = nil
            }
            
            //Calculate the value string
            
            let valueString: String
            
            switch (rating) {
            case  0:
                valueString = "No stars set."
            case 1:
                valueString = "One star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            //Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
            
            
        }
        
    }
}

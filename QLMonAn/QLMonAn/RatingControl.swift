//
//  RatingControl.swift
//  QLMonAn
//
//  Created by Phan Tien Nhan on 6/21/20.
//  Copyright © 2020 Phan Tien Nhan. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    @IBInspectable var rating = 0{
        didSet{
            updateButtonState()
        }
    }
    private var buttons = [UIButton]()
    @IBInspectable var buttonSize:CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            settupButtons()
        }
    }
    @IBInspectable var buttonCount:Int = 5{
        didSet{
            settupButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        settupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder:coder)
        settupButtons()
    }
    //MARK: Initiation of Rangting buttons
    private func settupButtons() {
        //Remove All Old Button
        for button in buttons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        buttons.removeAll()
        
        //Load and set images for the button
        let bundle = Bundle(for: type(of: self))
        let imageNormal = UIImage(named: "normal", in: bundle, compatibleWith: self.traitCollection)
        let imageHightlight = UIImage(named: "highlight", in: bundle, compatibleWith: self.traitCollection)
        let imageSelected = UIImage(named: "selected", in: bundle, compatibleWith: self.traitCollection)
        
        
        
        for _ in 0..<buttonCount {
            //Create a new Button
            let button = UIButton()
            //button.backgroundColor = UIColor.red
            
            
            //setbutton for eat
            button.setImage(imageNormal, for: .normal)
            button.setImage(imageSelected, for: .selected)
            button.setImage(imageHightlight, for: .highlighted)
            
            //button set size
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
            //Processing Event for the button
            button.addTarget(self, action: #selector(buttonPressend(button:)), for: .touchUpOutside)
            //Add the button to StackView
            addArrangedSubview(button)
            //Add To the button array
            buttons.append(button)
        }
         updateButtonState()
    }
    @objc private func buttonPressend(button:UIButton){
        guard let buttonIndex = buttons.firstIndex(of: button) else {
            fatalError("Can Not get the button index")
        }
        //Calulate the rating of rating control
        let selectedRating = buttonIndex + 1
        if selectedRating == rating {
            rating -= 1
        }else{
            rating = selectedRating
        }
       updateButtonState()
    }
    
    private func updateButtonState(){
        for (index,item) in buttons.enumerated() {
            item.isSelected = index<rating
        }
    }
}

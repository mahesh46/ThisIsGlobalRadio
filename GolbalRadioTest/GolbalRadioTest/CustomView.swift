//
//  CustomView.swift
//  GolbalRadioTest
//
//  Created by Administrator on 22/03/2016.
//  Copyright © 2016 mahesh lad. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var lastLocation:CGPoint = CGPointMake(0, 0)
    var  dropAreaView: UIView?
  
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    
        //randomize view color
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        
        dropAreaView?.frame =  CGRectMake(0, 200, 100, 100)
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 3
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
    }
    
   
}

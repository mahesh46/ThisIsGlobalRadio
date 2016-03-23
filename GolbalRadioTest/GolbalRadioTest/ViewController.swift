//
//  ViewController.swift
//  GolbalRadioTest
//
//  Created by Administrator on 22/03/2016.
//  Copyright © 2016 mahesh lad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lastLocation:CGPoint = CGPointMake(0, 0)
    var originCenter    = CGPointZero
    var insetSize : CGSize?
    let halfSizeOfView = 50.0
    let maxViews = 3
 
    
    @IBOutlet weak var dropAreaView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        insetSize = CGRectInset(self.view.bounds, CGFloat(Int(2 * halfSizeOfView)), CGFloat(Int(2 * halfSizeOfView))).size
        
        // Add the Views
        for _ in 0..<maxViews {
          AddView()
        }
        self.dropAreaView.layer.cornerRadius = 50
        dropAreaLocate()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func AddSquareAction(sender: AnyObject) {
         AddView()
    }
    
    
    
    @IBAction func BlackHoleAction(sender: AnyObject) {
        let subviews = view.subviews
        
        // Return if there are no subviews
        if subviews.count == 0 {
            return
        }
        
        for subview : AnyObject in subviews{
            
            // Do what you want to do with the subview
            if subview .isKindOfClass(CustomView) {

                originCenter = dropAreaView.center
                
                let custview = subview as! CustomView
                
                UIView.animateWithDuration(2.0, animations: {
                //custview.transform = CGAffineTransformMakeScale(0.1, 0.1)
                 custview.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.1, 0.1),CGAffineTransformMakeRotation(80))
                custview.center = self.originCenter
                self.dropAreaLocate()
                
                }, completion: { finished in
              
               custview.hidden = true
                custview.removeFromSuperview()
                
                })
                
            }
          
        }
        
    }
    
    
    func AddView() {
        let pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize!.width))))
        let pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize!.height))))
        
        let newView  = CustomView(frame: CGRect(x: pointX, y: pointY, width: 100.0, height: 100.0))
      
        let panRecognizer = UIPanGestureRecognizer(target:self, action:"draggedView:")
        let rotateRecogizer = UIRotationGestureRecognizer(target:self, action:"detectRotate:")
        let pinchRecogizer = UIPinchGestureRecognizer(target:self, action:"detectPinch:")
        let doubleTapRecogizer = UITapGestureRecognizer(target:self, action:"detectDoubleTap:")
        doubleTapRecogizer.numberOfTapsRequired = 2

        newView.addGestureRecognizer(panRecognizer)
        newView.addGestureRecognizer(rotateRecogizer)
        newView.addGestureRecognizer(pinchRecogizer)
        newView.addGestureRecognizer(doubleTapRecogizer)
        
        self.view.addSubview(newView)
        }
    
    func initTarget(panGesture: UIPanGestureRecognizer) {
        panGesture.addTarget(self, action: "draggedView:")
    }
    
    

    func draggedView(sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(sender.view!)
        let translation = sender.translationInView(self.view)
        switch sender.state {
        case UIGestureRecognizerState.Began:
            originCenter = sender.view!.center
            
        case UIGestureRecognizerState.Ended:
        
                if CGRectContainsPoint(self.dropAreaView.frame, sender.view!.center) {
                    
                   UIView.animateWithDuration(2.0, animations: {
                      //  sender.view!.transform = CGAffineTransformMakeScale(0.1, 0.1)
                         sender.view!.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.1, 0.1),CGAffineTransformMakeRotation(80))
                        self.dropAreaLocate()
                        
                        }, completion: { finished in
                            
                            sender.view!.hidden = true
                            sender.view!.removeFromSuperview()
                    })
                  
                } else {
               
                    self.dropAreaLocate()
                }
                
    
        case UIGestureRecognizerState.Changed:
            UIView.animateWithDuration(0.3, animations: { () -> Void in
               sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
    
            })
      
            default:
            break
        }
        
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    func detectRotate(recognizer:UIRotationGestureRecognizer) {
        let radians = recognizer.rotation
        recognizer.view!.transform = CGAffineTransformMakeRotation(radians)
    }
    
    func detectPinch(recognizer:UIPinchGestureRecognizer) {
        let scale = recognizer.scale
        recognizer.view!.transform = CGAffineTransformMakeScale(scale, scale)
      
    }

    func detectDoubleTap(recognizer:UIPanGestureRecognizer) {
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        recognizer.view!.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }


    func dropAreaLocate() {
        dropAreaView.backgroundColor = UIColor.clearColor()
        dropAreaView.layer.borderColor = UIColor.grayColor().CGColor
        dropAreaView.layer.borderWidth = 3
    }
    
   

}


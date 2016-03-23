//
//  GolbalRadioTestTests.swift
//  GolbalRadioTestTests
//
//  Created by Administrator on 22/03/2016.
//  Copyright © 2016 mahesh lad. All rights reserved.
//

import XCTest
@testable import GolbalRadioTest

class GolbalRadioTestTests: XCTestCase {
    var storyboard: UIStoryboard?
    var vc : ViewController?
    var countSquare = 0
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc  = (storyboard!.instantiateViewControllerWithIdentifier("ViewController")) as? ViewController
        vc!.viewDidLoad()
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        storyboard = nil
        vc  = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testStoryboardHasView() {
        
        XCTAssertNotNil(vc!.view, "ViewController should contain view")
        
    }

    /*
    func testViewHasThreeCustomeView() {
      
     // countSquare = MockCustomviewCount(vc!)
         XCTAssertEqual(countSquare,  3, "Number of square should be 3")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    */
    /*
    func MockCustomviewCount(vc : ViewController )->Int {
        let subviews = vc.view.subviews
        var customViewCount = 0
        // Return if there are no subviews
        if subviews.count == 0 {
            return 0
        }
        
        for subview : AnyObject in subviews{
            
            // Do what you want to do with the subview
            if subview .isKindOfClass(CustomView) {
                
                customViewCount = customViewCount + 1

            }
            
        }
        return customViewCount 
    }
    */
    
}

//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Aimee Bragg on 5/14/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    
   
    
    @IBAction func changeColor(sender: UIButton) {
        
        if let color = sender.backgroundColor {
            
            scratchPad.currentColor = color
            
        }
        
 //       currentColor = sender.backgroundColor!
        
    }
    
    
    @IBAction func clearLines(sender: AnyObject) {
        
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
    }
    
    @IBOutlet weak var scratchPad: ScratchView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
  //      view.addSubview(scratchPad)
  //      scratchPad.frame = view.frame
  //      scratchPad.backgroundColor = UIColor.whiteColor()
        
       
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            
            let location = touch.locationInView(scratchPad)
            scratchPad.newScratchWithStartPoint(location)
            
            
        }
        
        
    }

    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
           
            let location = touch.locationInView(scratchPad)
//            scratchPad.updateCurrentLineWithLastPoint(location)
            scratchPad.addPointToCurrentScratch(location)
            
        }
        
    }
    

}





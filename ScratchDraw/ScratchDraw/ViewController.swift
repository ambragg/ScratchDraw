//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Aimee Bragg on 5/14/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit


    
    
    
    



var fillColors: [UIColor] = [
    
    UIColor.magentaColor(),
    UIColor.cyanColor(),
    UIColor.yellowColor(),
    UIColor.blackColor(),
    UIColor.redColor()
]

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fillColorCollectionView: UICollectionView!
   
    @IBOutlet weak var scratchPad: ScratchView!
    
    
    @IBAction func clearLines(sender: AnyObject) {
        
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        fillColorCollectionView.dataSource = self
        fillColorCollectionView.delegate = self
        
        viewBottomConstraint.constant = -300
       
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return fillColors.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("colorCell", forIndexPath: indexPath) as! ColorCell
        
        cell.backgroundColor = fillColors[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ColorCell
        
        if let color = cell.backgroundColor {
            
            scratchPad.currentColor = color
            
        }
        
        
    }
    
    
    var currentColor = UIColor.blackColor()
    
    @IBAction func changeColor(sender: UIButton) {
        
        if let color = sender.backgroundColor {
            scratchPad.currentColor = color
            
        }
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
    
    

    
    
    @IBAction func showHide(sender: AnyObject) {
        
        viewBottomConstraint.constant = (viewBottomConstraint.constant == 0) ? -300 : 0
        
       // UIView.animateWithDuration(0.4, animations: { () -> Void in
           

      

        
        }
    

}





















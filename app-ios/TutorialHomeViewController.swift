//
//  TutorialHomeViewController.swift
//  argent-ios
//
//  Created by Sinan Ulkuatam on 5/1/16.
//  Copyright © 2016 Sinan Ulkuatam. All rights reserved.
//

import UIKit
import Gecco

class TutorialHomeViewController: SpotlightViewController {
    
    @IBOutlet var annotationViews: [UIView]!
    
    var stepIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    func next(labelAnimated: Bool) {
        updateAnnotationView(labelAnimated)
        
        let screenSize = UIScreen.mainScreen().bounds.size
        switch stepIndex {
        case 0:
            spotlightView.appear(Spotlight.Oval(center: CGPointMake(screenSize.width - 40, 50), diameter: 50))
        case 1:
            spotlightView.move(Spotlight.Oval(center: CGPointMake(screenSize.width/2, 200), diameter: 50))
        case 2:
            spotlightView.move(Spotlight.RoundedRect(center: CGPointMake(screenSize.width / 2, 243), size: CGSizeMake(screenSize.width-30, 40), cornerRadius: 6), moveType: .Disappear)
        case 3:
            spotlightView.move(Spotlight.RoundedRect(center: CGPointMake(screenSize.width / 2, 305), size: CGSizeMake(screenSize.width-100, 40), cornerRadius: 6), moveType: .Disappear)
        case 4:
            spotlightView.move(Spotlight.Oval(center: CGPointMake(20, screenSize.height/2-20), diameter: 50))
        case 5:
            spotlightView.move(Spotlight.RoundedRect(center: CGPointMake(screenSize.width / 2, screenSize.height-25), size: CGSizeMake(screenSize.width-20, 43), cornerRadius: 6), moveType: .Disappear)
        case 6:
            dismissViewControllerAnimated(true, completion: nil)
        default:
            break
        }
        
        stepIndex += 1
    }
    
    func updateAnnotationView(animated: Bool) {
        annotationViews.enumerate().forEach { index, view in
            UIView .animateWithDuration(animated ? 0.25 : 0) {
                view.alpha = index == self.stepIndex ? 1 : 0
            }
        }
    }
}

extension TutorialHomeViewController: SpotlightViewControllerDelegate {
    func spotlightViewControllerWillPresent(viewController: SpotlightViewController, animated: Bool) {
        next(false)
    }
    
    func spotlightViewControllerTapped(viewController: SpotlightViewController, isInsideSpotlight: Bool) {
        next(true)
    }
    
    func spotlightViewControllerWillDismiss(viewController: SpotlightViewController, animated: Bool) {
        spotlightView.disappear()
    }
}
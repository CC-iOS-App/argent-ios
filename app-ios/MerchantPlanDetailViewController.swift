//
//  MerchantPlanDetailViewController.swift
//  app-ios
//
//  Created by Sinan Ulkuatam on 5/29/16.
//  Copyright © 2016 Sinan Ulkuatam. All rights reserved.
//

import Foundation
import MZFormSheetPresentationController

class MerchantPlanDetailViewController: UIViewController {
    
    var planName:String?
    
    var planAmount:String?

    var planInterval:String?

    var planStatementDescriptor:String?

    var planTitleLabel = UILabel()

    var planStatementDescriptorLabel = UILabel()

    var planAmountLabel = UILabel()

    var planIntervalLabel = UILabel()

    var circleView = UIView()

    private let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.lightBlue()
        self.navigationController?.navigationBar.topItem!.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
        planTitleLabel.frame = CGRect(x: 0, y: 40, width: 300, height: 100)
        if let p_name = planName where planName != nil || planName != "" {
            planTitleLabel.attributedText = adjustAttributedString(p_name.uppercaseString, spacing: 1.5, fontName: "SFUIText-Regular", fontSize: 19, fontColor: UIColor.lightBlue(), lineSpacing: 0.0, alignment: .Center)
        }
        addSubviewWithBounce(planTitleLabel, parentView: self, duration: 0.3)
        
        circleView.frame = CGRect(x: (300-120)/2, y: 135, width: 120, height: 120)
        circleView.backgroundColor = UIColor.clearColor()
        circleView.layer.cornerRadius = circleView.frame.height/2
        circleView.layer.borderColor = UIColor.lightBlue().colorWithAlphaComponent(0.5).CGColor
        circleView.layer.borderWidth = 1
        addSubviewWithBounce(circleView, parentView: self, duration: 0.8)
        
        planAmountLabel.frame = CGRect(x: 0, y: 110, width: 300, height: 150)
        planAmountLabel.attributedText = formatCurrency(planAmount!, fontName: "SFUIText-Regular", superSize: 16, fontSize: 24, offsetSymbol: 5, offsetCents: 5)
        planAmountLabel.textAlignment = .Center
        planAmountLabel.textColor = UIColor.lightBlue().colorWithAlphaComponent(0.9)
        addSubviewWithBounce(planAmountLabel, parentView: self, duration: 0.3)
        if Int(planAmount!)! > 1000000 {
            planAmountLabel.attributedText = formatCurrency(planAmount!, fontName: "SFUIText-Regular", superSize: 12, fontSize: 18, offsetSymbol: 3, offsetCents: 3)
        }
        
        planIntervalLabel.frame = CGRect(x: 0, y: 165, width: 300, height: 100)
        planIntervalLabel.text = "per " + planInterval!
        planIntervalLabel.font = UIFont(name: "SFUIText-Regular", size: 12)
        planIntervalLabel.textAlignment = .Center
        planIntervalLabel.textColor = UIColor.lightBlue().colorWithAlphaComponent(0.7)
        addSubviewWithBounce(planIntervalLabel, parentView: self, duration: 0.3)
        
        planStatementDescriptorLabel.frame = CGRect(x: 0, y: 215, width: 300, height: 200)
        planStatementDescriptorLabel.numberOfLines = 0
        planStatementDescriptorLabel.font = UIFont(name: "SFUIText-Regular", size: 12)
        planStatementDescriptorLabel.textAlignment = .Center
        planStatementDescriptorLabel.textColor = UIColor.lightBlue().colorWithAlphaComponent(0.7)
        addSubviewWithBounce(planStatementDescriptorLabel, parentView: self, duration: 0.3)
        if planStatementDescriptor == "" {
            planStatementDescriptorLabel.text = "No statement descriptor provided \nfor plan " + planName!
        } else {
            planStatementDescriptorLabel.text = planStatementDescriptor
        }

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
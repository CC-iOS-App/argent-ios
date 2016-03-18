//
//  ProfileViewController.swift
//  paykloud-ios
//
//  Created by Sinan Ulkuatam on 3/7/16.
//  Copyright © 2016 Sinan Ulkuatam. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class ProfileViewController: UIViewController {
    
//    @IBOutlet weak var avatarImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGrayColor()]
        print("loaded profile")
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Style user avatar
//        avatarImageView.image = UIImage(named: "avatar")
//        avatarImageView.layer.cornerRadius = 1.0
//        avatarImageView.layer.borderColor = UIColor.blackColor().CGColor
//        avatarImageView.clipsToBounds = true
        
        if(userData?["user"]["picture"]["secureUrl"].stringValue != nil && userData?["user"]["picture"]["secureUrl"].stringValue.containsString("app") != true) {
            let userPicture = userData?["user"]["picture"]["secureUrl"].stringValue
            let pictureUrl = NSURL(string: userPicture!)
            let data = NSData(contentsOfURL: pictureUrl!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            if(data != nil) {
                print(data)
//                self.avatarImageView.image = UIImage(data: data!)
//                //self.avatarImageView.layer.cornerRadius = 4;
//                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
//                avatarImageView.layer.borderWidth = 2.0
                //self.avatarImageView.clipsToBounds = YES;
                SVProgressHUD.dismiss()
            } else {
//                self.avatarImageView.image = UIImage(named:"ic_user")
                // self.avatarImageView.image = UIImageView.setGravatar(Gravatar)
                SVProgressHUD.dismiss()
            }
            //print(userData)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
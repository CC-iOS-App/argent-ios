//
//  Profile.swift
//  protonpay-ios
//
//  Created by Sinan Ulkuatam on 3/19/16.
//  Copyright © 2016 Sinan Ulkuatam. All rights reserved.
//

import UIKit

final class Profile {
    
    static let sharedInstance = Profile()
    
    var image: UIImage?
    var firstName: String?
    var lastName: String?
    var username: String?
    var email: String?
    var birthDay: NSDate?
    var introduction: String?
    var moreInformation = false
    var ssn: String?
    var businessAddressLine1: String?
    var businessAddressLine2: String?
    var businessAddressCity: String?
    var businessAddressState: String?
    var businessAddressCountry: String?
    var businessAddressZip: String?
    var businessName: String?
    var businessType: String?
    var phoneNumber: String?
    
    let state = [ "AK",
                  "AL",
                  "AR",
                  "AS",
                  "AZ",
                  "CA",
                  "CO",
                  "CT",
                  "DC",
                  "DE",
                  "FL",
                  "GA",
                  "GU",
                  "HI",
                  "IA",
                  "ID",
                  "IL",
                  "IN",
                  "KS",
                  "KY",
                  "LA",
                  "MA",
                  "MD",
                  "ME",
                  "MI",
                  "MN",
                  "MO",
                  "MS",
                  "MT",
                  "NC",
                  "ND",
                  "NE",
                  "NH",
                  "NJ",
                  "NM",
                  "NV",
                  "NY",
                  "OH",
                  "OK",
                  "OR",
                  "PA",
                  "PR",
                  "RI",
                  "SC",
                  "SD",
                  "TN",
                  "TX",
                  "UT",
                  "VA",
                  "VI",
                  "VT",
                  "WA",
                  "WI",
                  "WV",
                  "WY",
    ]
}
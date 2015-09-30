//
//  UniversalProfile.swift
//  Hunt
//
//  Created by smorris on 9/29/15.
//  Copyright © 2015 LateNightGames. All rights reserved.
//

import Foundation

private let SharedProfile = UniversalProfile()

class UniversalProfile{
    
    class var sharedInstance : UniversalProfile
    {
        return SharedProfile
    }
    
    ///A single, shared instance of the current user's profile.
    ///This shared instance can be called from any class.
    var profile = Profile?()
}
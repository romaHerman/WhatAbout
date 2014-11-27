//
//  LoginController.swift
//  WhatAbout
//
//  Created by Roma Herman on 11/24/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

class LoginController: NSObject {
  
  class func enableAnonymousUser() {
    PFUser.enableAutomaticUser()
    PFUser.currentUser().incrementKey("RunCount")
    PFUser.currentUser().saveInBackgroundWithBlock { (status, error) -> Void in
      
    }
  }
  
  class func getUserID() -> String {
    return PFUser.currentUser().objectId
  }
  
}

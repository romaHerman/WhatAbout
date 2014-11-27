//
//  MySurveysViewController.swift
//  WhatAbout
//
//  Created by Roma on 11/16/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class MySurveysViewController: UIViewController {

  required init(coder aDecoder: NSCoder) {
    surveyFeedManager = SurveyFeedManager()
    super.init(coder: aDecoder)
  }
  
  @IBOutlet weak var tableView: UITableView!
  var surveyFeedManager: SurveyFeedManager
  var notificationToken: RLMNotificationToken?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startObservingDataUpdates()
    setUpTableViewManager()
  }
  
//MARK: RealmMethods
  func startObservingDataUpdates() {
    // Set realm notification block
    notificationToken = RLMRealm.defaultRealm().addNotificationBlock { note, realm in
      self.surveyFeedManager.reloadData()
    }
  }
  
//MARK: Custom Methods
  func setUpTableViewManager() {
    surveyFeedManager = SurveyFeedManager(tableView: tableView)
    surveyFeedManager.reloadData()
  }

    /*⤴︎
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

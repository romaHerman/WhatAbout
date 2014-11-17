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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    surveyFeedManager = SurveyFeedManager(tableView: tableView)
    surveyFeedManager.tableView.reloadData()
    
    // Do any additional setup after loading the view.
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

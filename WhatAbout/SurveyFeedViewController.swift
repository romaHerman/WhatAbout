//
//  SurveyFeedViewController.swift
//  WhatAbout
//
//  Created by Roma on 11/16/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class SurveyFeedViewController: UIViewController, SurveyFeedManagerDelegate {
  
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
    surveyFeedManager.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func surveySelected(survey: Survey) {
    performSegueWithIdentifier("SurveyDetailSegue", sender: survey)
  }
  
  
  // MARK: - Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "SurveyDetailSegue" {
      let destinationVC = segue.destinationViewController as TakeSurveyViewController
      let selectedSurvay = sender as Survey
      destinationVC.survey = selectedSurvay
    }
  }
}

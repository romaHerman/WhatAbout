//
//  AddSurveyViewController.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class AddSurveyViewController: UIViewController, AddSurveyTableManagerDelegate {

  required init(coder aDecoder: NSCoder) {
    surveyComposeManager = AddSurveyTableManager()
    super.init(coder: aDecoder)
  }
  
  @IBOutlet weak var tableView: UITableView!
  var surveyComposeManager: AddSurveyTableManager
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpTableViewManager()
    
    addSaveButton()
  }
  
// MARK: Custom Methods
  func addSaveButton() {
    let saveButton = UIBarButtonItem(
      title: "Save",
      style: UIBarButtonItemStyle.Bordered,
      target: self,
      action: Selector("saveTapped"))
    
    self.navigationItem.rightBarButtonItem = saveButton
    self.navigationItem.rightBarButtonItem?.enabled = false
  }
  
  func saveTapped() {
    let surveyData = surveyComposeManager.getSurveyData()
    WADataController.addSurveyInBackground(surveyData)
  }
  
  func setUpTableViewManager() {
    surveyComposeManager = AddSurveyTableManager(tableView: tableView)
    surveyComposeManager.delegate = self
    surveyComposeManager.tableView.reloadData()
  }

// MARK: AddSurveyTableManagerDelegate
  func canSaveSurvey(isCanSave:Bool) {
    self.navigationItem.rightBarButtonItem?.enabled = isCanSave
  }
  
  
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

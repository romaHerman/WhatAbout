//
//  AddSurveyViewController.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class AddSurveyViewController: UIViewController {

  required init(coder aDecoder: NSCoder) {
    surveyComposeManager = AddSurveyTableManager()
    super.init(coder: aDecoder)
  }
  
  @IBOutlet weak var tableView: UITableView!
  var surveyComposeManager: AddSurveyTableManager
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    surveyComposeManager = AddSurveyTableManager(tableView: tableView)
    surveyComposeManager.tableView.reloadData()
    
    // Do any additional setup after loading the view.
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

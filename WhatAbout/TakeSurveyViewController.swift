//
//  TakeSurveyViewController.swift
//  WhatAbout
//
//  Created by Roma Herman on 11/26/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class TakeSurveyViewController: UIViewController {

  required init(coder aDecoder: NSCoder) {
    takeSurveyTableManager = TakeSurveyTableManager()
    super.init(coder: aDecoder)
    
  }
  var survey:Survey!
  
  @IBOutlet weak var tableView: UITableView!
  var takeSurveyTableManager: TakeSurveyTableManager
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    takeSurveyTableManager = TakeSurveyTableManager(tableView: tableView)
    takeSurveyTableManager.tableView.reloadData()
    takeSurveyTableManager.survey = self.survey
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

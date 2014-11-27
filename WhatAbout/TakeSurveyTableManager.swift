//
//  TakeSurveyTableManager.swift
//  WhatAbout
//
//  Created by Roma Herman on 11/26/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class TakeSurveyTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
  
  let tableView: UITableView!
  var survey:Survey!
  
  override init() {
    super.init()
  }
  
  init(tableView: UITableView) {
    super.init()
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView = tableView
  }
  
// MARK: - TableViewDartasource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = survey?.answers?.count {
      return Int(count)
    }
    return 0
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if let text = survey?.surveyText {
      return survey.surveyText
    }
    return ""
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TakeSurveyCell") as TakeSurveyCell
    if let answer = survey.answers[UInt(indexPath.row)] as? Answer {
      cell.textLabel.text = answer.text
      cell.answerRate.text = "\(answer.rate)"
    }
    return cell
  }
  
  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
//MARK: - TableViewDelegate 
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //
  }
   
}

//
//  AddSurveyTableManager.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class AddSurveyTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
  let tableView: UITableView!
  var answers: Array<String> = [ ]
  
  override init() {
    super.init()
  }
  
  init(tableView: UITableView) {
    super.init()
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView = tableView
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var numberOfRows = 0
    
    switch section {
    case 0:
      numberOfRows = 1
    case 2:
      numberOfRows = 1
      break
    case 1:
      numberOfRows = answers.count
      break
    default:
      numberOfRows = 0
      break
    }
    
    return numberOfRows
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    var height = 40.0
    
    switch indexPath.section {
    case 0:
      height = 120.0
      break
    case 2:
      height = 44.0
    case 1:
      height = 44.0
      break
    default:
      height = 44.0
      break
    }
    
    return CGFloat(height)
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    var cell:UITableViewCell!
    
    switch indexPath.section {
    case 0:
      cell = tableView.dequeueReusableCellWithIdentifier("SurveyTextTableViewCell") as SurveyTextTableViewCell
      break
    case 1:
      let answerCell: AnswerTableViewCell = tableView.dequeueReusableCellWithIdentifier("AnswerTableViewCell") as AnswerTableViewCell
      let answer = answers[indexPath.row]
      if !answer.isEmpty {
        answerCell.answerText.text = answer
      }
      cell = answerCell
    case 2:
      cell = tableView.dequeueReusableCellWithIdentifier("AddAnswerTableViewCell") as AddAnswerTableViewCell
      break
    default:
      cell = tableView.dequeueReusableCellWithIdentifier("AnswerTableViewCell") as AnswerTableViewCell
      break
    }

    
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if indexPath.section == 2 {
      NSLog("sss")
      answers.append("")
      
      tableView.beginUpdates()
      tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: answers.count - 1, inSection: 1)], withRowAnimation: UITableViewRowAnimation.Left)
      tableView.endUpdates()
    }
    
  }
  
}

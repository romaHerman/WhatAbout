//
//  SurveyFeedManager.swift
//  WhatAbout
//
//  Created by Roma on 11/16/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit
import QuartzCore

protocol SurveyFeedManagerDelegate {
  func surveySelected(survey:Survey)
}

class SurveyFeedManager: NSObject, UITableViewDataSource, UITableViewDelegate {
  let tableView: UITableView!
  var surveys:RLMResults?

  var delegate:SurveyFeedManagerDelegate?
  
  let colors = ["20B2AA"]//, "00CED1","228B22","DAA520","CD5C5C" ,"ADD8E6", "F08080","20B2AA","87CEFA","9370DB","48D1CC","FFA500","2E8B57", "9ACD32"]483D8B
  
  override init() {
    super.init()
  }
  
  init(tableView: UITableView) {
    super.init()
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView = tableView
    surveys = Survey.allObjects()
  }
// MARK: TableViewDartasource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = surveys?.count {
      return Int(count)
    }
    
    return 0
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 120.0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("SurveyFeedTableViewCell") as SurveyFeedTableViewCell
    
    if let survey = surveys![UInt(indexPath.row)] as? Survey {
      cell.content.text = survey.surveyText
      cell.content.numberOfLines = 0
      
      cell.contentBackground.layer.borderWidth = 1.0
      cell.contentBackground.layer.cornerRadius = 12.0
      cell.contentBackground.layer.borderColor = UIColor.whiteColor().CGColor
      let randomNumber = arc4random_uniform(UInt32(colors.count))
      cell.contentBackground.backgroundColor = UIColor(rgba: "#\(colors[Int(randomNumber)])")
    }
    return cell
  }

//MARK: TableViewDelegate
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if let survey = surveys![UInt(indexPath.row)] as? Survey {
      delegate?.surveySelected(survey)
    }
  }
  
//MARK: CustomMethods
  func reloadData() {
    surveys = Survey.allObjects()//.sortedResultsUsingProperty("creationDate", ascending: true)
    tableView.reloadData()
  }

  // MySurveyDetails
}

//
//  AddSurveyTableManager.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

protocol AddSurveyTableManagerDelegate {
  func canSaveSurvey(Bool)
}

class AddSurveyTableManager: NSObject, UITableViewDelegate, UITableViewDataSource, SurveyTextTableViewCellDelegate, AnswerTableViewCellDelegate {
  
  let tableView: UITableView!
  var answers: Array<String> = [ ]
  var surveyQuestion = ""
  
  var delegate:AddSurveyTableManagerDelegate?
  
  override init() {
    super.init()
  }
  
  init(tableView: UITableView) {
    super.init()
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView = tableView
  }

// MARK: TableView Datasource
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
      let surveyCell: SurveyTextTableViewCell = tableView.dequeueReusableCellWithIdentifier("SurveyTextTableViewCell") as SurveyTextTableViewCell
      surveyCell.delegate = self
      cell = surveyCell
      break
    case 1:
      let answerCell: AnswerTableViewCell = tableView.dequeueReusableCellWithIdentifier("AnswerTableViewCell") as AnswerTableViewCell
      let answer = answers[indexPath.row]
      if !answer.isEmpty {
        answerCell.answerText.text = answer
      }
      answerCell.delegate = self
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
// MARK: Tableview delegate
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    if indexPath.section == 2 {
      answers.append("")
      
      tableView.beginUpdates()
      tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: answers.count - 1, inSection: 1)], withRowAnimation: UITableViewRowAnimation.Left)
      tableView.endUpdates()
    }
    
  }
  
// MARK: Cell Delegates
  
  func surveyQuestionEntered(question: String) {
    surveyQuestion = question
    checkIfSurveyDayaEnough()
  }
  
  func answerTextAdded(cell: AnswerTableViewCell) {
    if let cellIndexPath: NSIndexPath = tableView.indexPathForCell(cell) {
      answers[cellIndexPath.row] = cell.answerText.text
      checkIfSurveyDayaEnough()
    }
  }
  
// MARK: SurveyManager methods
  
  func getSurveyData () -> (String, Array<String>) {
    return (surveyQuestion, answers)
  }
  
  func checkIfSurveyDayaEnough() {
    if countElements(surveyQuestion) > 0 && answers.count > 0 {
      delegate?.canSaveSurvey(true)
    } else {
      delegate?.canSaveSurvey(false)
    }
  }
  
}

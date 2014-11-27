//
//  WARemoteDataController.swift
//  WhatAbout
//
//  Created by Roma Herman on 11/23/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//


class WARemoteDataController: NSObject {

  class func saveSurveyRemotely(survey:Survey, answers:Array<String>, complition:(surveyId:String, answersId:[String]) -> Void) {
    let surveyPF = PFObject(className:"Survey")
    surveyPF["creatorID"] = PFUser.currentUser().objectId
    surveyPF["surveyText"] = survey.surveyText
    surveyPF["creationDate"] = survey.creationDate
    surveyPF["surveyID"] = survey.surveyID
    surveyPF.saveInBackgroundWithBlock { (success, error) -> Void in
      
    }

    var answersId:Array<String> = []
    let answersCount = Int(survey.answers.count)
    for answer  in survey.answers {
      let answersPF = PFObject(className:"Answer")
      let answer = answer as Answer
      answersPF["surveyID"] = survey.surveyID
      answersPF["text"] = answer.text
      answersPF["rate"] = 0.0
      answersPF["answerId"] = answer.answerID
      println("a id = \(answer.answerID)")
      answersPF.saveInBackgroundWithBlock({ (success, error) -> Void in
        answersId.append(String(answersPF["answerId"] as NSString))
        if answersId.count == answersCount {
          surveyPF["answersId"] = answersId
          surveyPF.saveInBackgroundWithBlock({ (success, error) -> Void in
            complition(surveyId: surveyPF.objectId, answersId: answersId)
          })
        }
      })
    }
    
  }
  
  class func updateSurveyFeed() {
    let query = PFQuery(className: "Survey")
    
    let lastDate = NSUserDefaults.standardUserDefaults().objectForKey("lastUpdateDate") as NSDate
    query.whereKey("updatedAt", greaterThan: lastDate)
    query.findObjectsInBackgroundWithBlock { (arrayOfSurveys, error) -> Void in
      println("array = \(arrayOfSurveys) error = \(error)")
    }
  }
  
}
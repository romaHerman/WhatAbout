//
//  WADataController.swift
//  WhatAbout
//
//  Created by Roma Herman on 11/23/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

let RealmSchemaVersion:UInt = 4

class WADataController: NSObject {
  
  class func addSurveyInBackground(rawSurvey:(String,Array<String>)) {
    
    let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
    dispatch_async(queue) {
      // Get new realm and table since we are in a new thread
      let realm = RLMRealm.defaultRealm()
      //open saving to disk operation
      realm.beginWriteTransaction()
      //create survey
      let survey = self.getSurveyFromRawData(rawSurvey)
      //save survey
      realm.addObject(survey)
      //finish save to disc operation
      realm.commitWriteTransaction()

      WARemoteDataController.saveSurveyRemotely(survey, answers:rawSurvey.1, complition: { (surveyId, answersId) -> Void in
        
      })
    }
    
  }
  
  class func getSurveyFromRawData(rawSurvey:(String,Array<String>)) -> Survey {
    //create survey
    let survey = Survey()
    survey.surveyText = rawSurvey.0
    survey.creationDate = NSDate()
    survey.creatorID = LoginController.getUserID()
    let surveyUniqID = CFUUIDCreateString(nil, CFUUIDCreate(nil))
    survey.surveyID = surveyUniqID
    //create realm answers array from rawArrayWithStrings
    let answersArray = RLMArray(objectClassName: Answer.className())
    for answerString in rawSurvey.1 {
      let answerUniqID = CFUUIDCreateString(nil, CFUUIDCreate(nil))
      let answer = Answer()
      answer.text = answerString
      answer.answerID = answerUniqID
      answer.surveyID = survey.surveyID
      answersArray.addObject(answer)
    }
    //add relamArray to survey
    survey.answers = answersArray
    return survey
  }
  
  class func performRealmMigrationIfNeeded() {
    RLMRealm.setSchemaVersion(RealmSchemaVersion, withMigrationBlock: { migration, oldSchemaVersion in
      // We haven’t migrated anything yet, so oldSchemaVersion == 0
      if oldSchemaVersion < RealmSchemaVersion {
        // Nothing to do!
        // Realm will automatically detect new properties and removed properties
        // And will update the schema on disk automatically
      }
      println("Migration complete.")
    })
  }

}

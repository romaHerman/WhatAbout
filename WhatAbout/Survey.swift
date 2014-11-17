//
//  Survey.swift
//  WhatAbout
//
//  Created by Roma on 11/16/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

class Survey: RLMObject {
  dynamic var creatorID = ""
  dynamic var surveyText = ""
  dynamic var creationDate = NSDate(timeIntervalSince1970: 1)
  dynamic var answers = RLMArray(objectClassName: Answer.className())
}

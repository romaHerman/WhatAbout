//
//  SurveyFeedManager.swift
//  WhatAbout
//
//  Created by Roma on 11/16/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit
import QuartzCore

class SurveyFeedManager: NSObject, UITableViewDataSource, UITableViewDelegate {
  let tableView: UITableView!
  let surveys = [ ]

  let colors = ["483D8B", "00CED1","228B22","DAA520","CD5C5C" ,"ADD8E6", "F08080","20B2AA","87CEFA","9370DB","48D1CC","FFA500","2E8B57", "9ACD32"]
  
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
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //return surveys.count
    return 10
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 120.0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("SurveyFeedTableViewCell") as SurveyFeedTableViewCell
    //let survey = surveys[indexPath.row] as Survey
    //cell.content.text = survey.surveyText
    cell.content.text = "threre is a survey text pretty long because i want to now how it looks?"
    cell.content.numberOfLines = 0
    
    cell.contentBackground.layer.borderWidth = 1.0
    cell.contentBackground.layer.cornerRadius = 12.0
    cell.contentBackground.layer.borderColor = UIColor.whiteColor().CGColor
    let randomNumber = arc4random_uniform(UInt32(colors.count))
    cell.contentBackground.backgroundColor = UIColor(rgba: "#\(colors[Int(randomNumber)])")
    
    return cell
  }
}

extension UIColor {
  convenience init(rgba: String) {
    var red:   CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue:  CGFloat = 0.0
    var alpha: CGFloat = 1.0
    
    if rgba.hasPrefix("#") {
      let index   = advance(rgba.startIndex, 1)
      let hex     = rgba.substringFromIndex(index)
      let scanner = NSScanner(string: hex)
      var hexValue: CUnsignedLongLong = 0
      if scanner.scanHexLongLong(&hexValue) {
        if countElements(hex) == 6 {
          red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
          green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
          blue  = CGFloat(hexValue & 0x0000FF) / 255.0
        } else if countElements(hex) == 8 {
          red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
          green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
          blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
          alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
        } else {
          print("invalid rgb string, length should be 7 or 9")
        }
      } else {
        println("scan hex error")
      }
    } else {
      print("invalid rgb string, missing '#' as prefix")
    }
    self.init(red:red, green:green, blue:blue, alpha:alpha)
  }
}

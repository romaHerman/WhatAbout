//
//  SurveyTextTableViewCell.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

protocol SurveyTextTableViewCellDelegate {
  func surveyQuestionEntered(question: String)
}

class SurveyTextTableViewCell: UITableViewCell, UITextViewDelegate {
  
  @IBOutlet weak var surveyText: UITextView!
  
  var delegate:SurveyTextTableViewCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    if text == "\n" {
      textView.resignFirstResponder()
      delegate?.surveyQuestionEntered(textView.text)
      return false;
    }
    
    return true;
  }
  
}

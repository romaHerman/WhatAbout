//
//  AnswerTableViewCell.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

protocol AnswerTableViewCellDelegate {
  func answerTextAdded(cell:AnswerTableViewCell)
}

class AnswerTableViewCell: UITableViewCell, UITextFieldDelegate {
  
  @IBOutlet weak var answerText: UITextField!
  
  var delegate:AnswerTableViewCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    delegate?.answerTextAdded(self)
    textField.resignFirstResponder()
    return false
  }
  
}

//
//  AnswerTableViewCell.swift
//  WhatAbout
//
//  Created by Roma on 11/17/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
  
  @IBOutlet weak var answerText: UITextField!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

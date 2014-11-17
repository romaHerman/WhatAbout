//
//  SurveyFeedTableViewCell.swift
//  WhatAbout
//
//  Created by Roma on 11/16/14.
//  Copyright (c) 2014 Roma. All rights reserved.
//

import UIKit

class SurveyFeedTableViewCell: UITableViewCell {
  
  @IBOutlet weak var content: UILabel!
  @IBOutlet weak var contentBackground: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

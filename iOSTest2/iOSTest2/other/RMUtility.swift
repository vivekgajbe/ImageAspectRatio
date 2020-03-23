//
//  RMUtility.swift
//  Animation_test
//
//  Created by vivek G on 21/03/20.
//  Copyright © 2020 vivek G. All rights reserved.
//

import UIKit

class RMUtility: NSObject {

    static let shared = RMUtility()

    
    /// function is to format a date as per input format
    ///
    /// - Parameters:
    ///   - date: input date
    ///   - format: change date format
    /// - Returns: converted date
    func formatDate(date: NSDate , format : String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date as Date)
    }
    
    
    /// Method is used for to set view with corner radious  & shadow effect
    ///
    /// - Parameter viw: view container
    func setViewWithCronerRadious_Shadow(viw:UIView)
    {
        viw.layer.cornerRadius = 20
        viw.layer.masksToBounds = true;
        
        viw.backgroundColor = UIColor.white
        viw.layer.shadowColor = UIColor.lightGray.cgColor
        viw.layer.shadowOpacity = 0.8
        viw.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viw.layer.shadowRadius = 6.0
        viw.layer.masksToBounds = false
    }
}

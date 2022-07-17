//
//  Extensions.swift
//  pomodoro-app
//
//  Created by Намик on 7/16/22.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat,
                    green: CGFloat,
                    blue: CGFloat) -> UIColor {
        return UIColor(red: red/255,
                       green: green/255,
                       blue: blue/255,
                       alpha: 1)
    }
    
    static let lightBlueColor = UIColor.rgb(red: 29,
                                            green: 161,
                                            blue: 242)
}


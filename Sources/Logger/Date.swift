//
//  File.swift
//  
//
//  Created by Lucas on 28/05/2020.
//

import Foundation

extension Date {
    func convertToString() -> String {
        return Logger.dateFormatter.string(from: self)
    }
}


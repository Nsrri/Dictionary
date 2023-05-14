//
//  AppError.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 14.05.23.
//

import Foundation

struct AppError: Identifiable {
    var id = UUID().uuidString;
    var errorString: String
    
}

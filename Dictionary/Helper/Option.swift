//
//  FilterButton.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 19.03.23.

import Foundation

struct Option: Equatable {
    static func == (lhs: Option, rhs: Option) -> Bool {
        return lhs.id == rhs.id
    }
    
    var title: String
    var id: UUID
    
    init(title: String, id: UUID = UUID()) {
        self.title = title
        self.id = id
    }
}

//
//  FilterButton.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 19.03.23.

import Foundation

struct FilterButton: Equatable {
    static func == (lhs: FilterButton, rhs: FilterButton) -> Bool {
        return lhs.id == rhs.id
    }
    
    var title: String
    var id: UUID
    
    init(title: String, id: UUID = UUID()) {
        self.title = title
        self.id = id
    }
}

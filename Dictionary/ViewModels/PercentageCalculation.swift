//
//  PercentageCalculation.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 15.01.23.
//

import Foundation
import SwiftUI

struct PercentageCalculatior {
    func getAddedVerbsPercentage(_ array: FetchedResults<Verbs>) -> Double {
        return Double(array.count) * 100 / 5000
    }
    

}

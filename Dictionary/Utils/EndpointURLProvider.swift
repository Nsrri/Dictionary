//
//  Constants.swift
//  Dictionary
//
//  Created by Nasrin Jafari on 09.02.23.
//

import Foundation
import SwiftUI


protocol URLProvider {
    var baseURL: URL {get}
    var UserEndpoint: URL {get}
}


struct EndpointURLProvider: URLProvider {
    
    var baseURL: URL {
        return URL(string: "http://172.20.10.2:8081")!
    }
    
    var UserEndpoint: URL {
        return baseURL.appendingPathComponent("/verb")
    }
}




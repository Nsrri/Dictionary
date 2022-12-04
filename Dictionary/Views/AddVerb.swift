//
//  Add.swift
//  Worterbuch
//
//  Created by NasrinJafari(Personal) on 05.10.22.
//

import SwiftUI

struct AddVerb: View {
    @Environment(\.managedObjectContext) private var moc
    
    @State var verb: String = ""
    @State var tenses: [String] = []
    @State var pasts: [String] = []
    @State var explanation: String = ""
    @State var examples: [String] = []
    
    
    var body: some View {
        Text("From here you can add new words to our app")
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        AddVerb()
    }
}

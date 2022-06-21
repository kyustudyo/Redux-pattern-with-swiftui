//
//  InsteadOfIfStatements.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/05/14.
//

import SwiftUI
struct Person {
    var age: Int
}
struct InsteadOfIfStatements: View {
    @State var person : Person?
    @State var text = ""
    var body: some View {
        Text(text)
            .onAppear{
                person = Person(age: 22)
                text = getString(person: person)
                
            }
    }
    func getString(person:Person?)->String{
        guard let person = person else {
            return "you are a robot"
        }
        guard person.age >= 18 else {return "not"}
        guard person.age >= 21 else {return "no in us"}
        return "have a good time"
        

    }
}

struct InsteadOfIfStatements_Previews: PreviewProvider {
    static var previews: some View {
        InsteadOfIfStatements()
    }
}

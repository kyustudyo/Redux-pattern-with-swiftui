//
//  edgeInset.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/17.
//

import SwiftUI

struct edgeInset: View {
    //edgeinset은 그냥 패딩과다르다
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 10))
                .background(.red)
            Text("Helo, World!")
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
                .background(.red)
        }
        
        
    }
}

struct edgeInset_Previews: PreviewProvider {
    static var previews: some View {
        edgeInset()
    }
}

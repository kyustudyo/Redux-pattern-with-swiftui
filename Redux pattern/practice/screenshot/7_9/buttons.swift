//
//  buttons.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/07/09.
//

import SwiftUI

struct buttons: View {
    var body: some View {
        VStack {
            Button {
                print("df")
            } label: {
                Text("fg")
                    .padding()
                    .background(.red)
            }
            Text("dfdf")
                .padding()
                .background(.blue)
                .onTapGesture {
                    print("k")
                }

        }
    }
}

struct buttons_Previews: PreviewProvider {
    static var previews: some View {
        buttons()
    }
}

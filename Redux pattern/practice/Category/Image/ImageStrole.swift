//
//  ImageStrole.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/17.
//

import SwiftUI

struct ImageStrole: View {
    var body: some View {
        Image("1")
            .resizable()
            .frame(width:200, height: 200)
            .cornerRadius(30)
        //이미지에다 직접 stroke못주는듯
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 10)
            )
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(.white, lineWidth: 50))
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(.purple))
    }
}

struct ImageStrole_Previews: PreviewProvider {
    static var previews: some View {
        ImageStrole()
    }
}

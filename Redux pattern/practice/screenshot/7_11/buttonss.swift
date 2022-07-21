//
//  buttonss.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/07/12.
//

import SwiftUI

struct buttonss: View {
    var body: some View {
        HStack {
            ForEach([1,2,3], id: \.self) { index in
                Text("\(index)")
            }
        }
    }
}

struct buttonss_Previews: PreviewProvider {
    static var previews: some View {
        buttonss()
    }
}

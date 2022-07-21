//
//  Card.swift
//  dds
//
//  Created by Hankyu Lee on 2022/06/16.
//

import SwiftUI

struct CardView: View {
    
    var color: Color
    var account: String
    var date: Date
    
    @ViewBuilder
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text("1차 고깃집 파티~")
                Spacer()
                Text("총 130,000원 (6명)")
                Spacer()
                Text("우리은행")
                Text(account)
            }
            .frame(width: 210)
            .padding(20.0)
            .background(color)
            .opacity(0.71)
            
            VStack(alignment: .trailing) {
                Text("qweqwe")
                Spacer()
                Text("05/22")
            }
            .frame(width: 50)
            .padding(20.0)
            .background(color)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: 300, height: 200)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: .blue, account: "sda", date: Date())
    }
}

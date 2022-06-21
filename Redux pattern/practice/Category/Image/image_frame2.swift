//
//  image_frame2.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/17.
//

import SwiftUI

struct image_frame2: View {
    var body: some View {
        VStack {
//            Image("1")
//                .resizable()//어떻게든 들어가게
//                .aspectRatio(contentMode: .fill)//비율맞추고 넘어가라 프레임을
//                .frame(width:200, height: 150)
//
//                .cornerRadius(55)//cornerraidus 하면 알아서 나간부분 잘린다.
            
            Image("1")
                .resizable()
                .frame(width: 100, height: 100)
                .frame(width: 200, alignment: .leading)
            VStack(alignment:.center) {//현재 있는 프레임을 기준으로.
                Text("hasdf")
                    .font(.largeTitle)
                Text("dfdffddfdfdf")
                    .font(.title3)
            }
            .frame(maxWidth:.infinity, alignment: .leading)//
            
        }
        
                        
            
    }
}

struct image_frame2_Previews: PreviewProvider {
    static var previews: some View {
        image_frame2()
    }
}

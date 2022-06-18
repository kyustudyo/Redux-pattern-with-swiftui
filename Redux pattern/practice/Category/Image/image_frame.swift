//
//  image.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/06/17.
//

import SwiftUI

struct image_frame: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("asd")
            Text("ddfdf")
            Image("1")
                .resizable()
                .aspectRatio(1,contentMode: .fit)
                .frame(width: 50)
                .border(.red, width: 5)
                .frame(width: 100, height: 100, alignment: .leading)
                .border(.yellow, width: 10)
            
            //Edge Inset
            Text("가나다라마바사")
                .background(.yellow)
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 40, trailing: 30))
                .background(.red)
        }
        .frame(width: 200, height: 600, alignment: .leading)
        .border(.purple, width: 4)
       
        

            
        
    }
}

struct iimage_framePreviews: PreviewProvider {
    static var previews: some View {
        image_frame()
    }
}

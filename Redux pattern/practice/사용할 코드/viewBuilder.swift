////
////  viewBuilder.swift
////  Redux pattern
////
////  Created by Hankyu Lee on 2022/05/22.
////
//
//import SwiftUI
////이런식으로 reuse 할 view를 만들면 custom 하기가 복잡해진다.. optional 로 받으면 if let 남발 -> 코드복잡
///
import SwiftUI
struct HeaderViewRegular: View {
    let title: String
    let description : String?
    let iconName: String?
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.regular)
            if let description = description {
                Text(description)
                    .fontWeight(.light)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height:2)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
            .padding()
    }
    
}
//
//
////다양하게 활용할 수 있도록. generic
struct HeaderViewGeneric<Content:View> : View {
    let title : String
    let content: Content
    //클로저로 써야 더 보기 좋으므로 viewbuilder.
    init(title:String, @ViewBuilder content: ()-> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.regular)
            content
            RoundedRectangle(cornerRadius: 5)
                .frame(height:2)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
            .padding()
    }
    
    
}
////비슷한 방식으로 custom.
struct CustomHStack<Content:View> : View {
    let content: Content
    init(@ViewBuilder content: ()->Content) {
        self.content = content()
    }
    var body: some View {
        HStack {
            content
        }
    }
}
//
struct LocalViewBuilder: View {
    enum ViewType {
        case one, two, three
    }
    let type: ViewType
    var body: some View {
        VStack{
//            headerSection//얘로해도되고
            
//            if type == .one {
//                viewOne
//            }
//            else if type == .two {
//                viewTwo
//            }
//            else if type == .three {
//                viewThree
//            }
            
            headerSection2//얘로해도되고
        }
    }
    private var headerSection : some View {
        
        //이렇게만 하면 안됨. 모두가 다른거를 반환하므로.
//        if type == .one {
//            viewOne
//        }
//        else if type == .two {
//            viewTwo
//        }
//        else if type == .three {
//            viewThree
//        }
        
        //따라서 이렇게 안에다가 넣는다.
        HStack{
            if type == .one {
                        viewOne
            }
            else if type == .two {
                viewTwo
            }
            else if type == .three {
                viewThree
            }
        }
    }
    //또는 viewbuilder로 가능
    @ViewBuilder private var headerSection2: some View {
//        if type == .one {
//                    viewOne
//        }
//        else if type == .two {
//            viewTwo
//        }
//        else if type == .three {
//            viewThree
//        }
        switch type {
        case .one:
            viewOne
        case . two
            :viewTwo
        case .three : viewThree
        }
    }
    private var viewOne : some View {
        Text("one")
    }
    private var viewTwo : some View {
        VStack {
            Text("two")
            Image(systemName: "heart.fill")
        }
    }
    private var viewThree : some View {
        Image(systemName: "heart.fill")
    }
}
//
//struct viewBuilder: View {
//    var body: some View {
//        
//        VStack{
//            HeaderViewRegular(title: "new title", description: "hello", iconName: "heart.fill")
//            HeaderViewRegular(title: "new", description: nil, iconName: nil)
////            HeaderViewGeneric(title: "generic title", content: Text("Hello"))
////            HeaderViewGeneric(title: "generic 2", content: Image(systemName: "heart.fill"))
////            HeaderViewGeneric(title: "generic 2", content: HStack{
////                Text("hello")
////                Image(systemName: "bolt.fill")
////            })//viewbuilder를 이용해서 클로저로 써보자.
//            HeaderViewGeneric(title: "generic title") {
//                Text("hihi")
//            }
//            //custom
//            CustomHStack{
//                Text("hgh")
//                Text("hgh")
//                Text("hgh")
//            }
//            //normal
//            HStack{
//                Text("hgh")
//                Text("hgh")
//                Text("hgh")
//            }
//            Spacer()
//            
//        }
//        
//    }
//}
//
//
//
//
//struct viewBuilder_Previews: PreviewProvider {
//    static var previews: some View {
////        viewBuilder()
//        LocalViewBuilder(type: .two)
//    }
//}
//
//

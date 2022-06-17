import UIKit
import SwiftUI
//보면 WetherVM의 cityName은 published가 아님. 16줄.
//offset 사용.
//struct ContentView: View {
//
//    @ObservedObject var weatherVM: WeatherViewModel
//
//    init() {
//        self.weatherVM = WeatherViewModel()
//    }
//
//    var body: some View {
//        VStack(alignment: .center) {
//

//            TextField("Enter city name", text: self.$weatherVM.cityName) {
//                self.weatherVM.search()
//            }.font(.custom("Arial", size: 50))
//                .padding()
//                .fixedSize()
//
//            Text(self.weatherVM.temperature)
//            .font(.custom("Arial", size: 100))
//
//                           .foregroundColor(Color.white)
//                           .offset(y: 100)
//                           .padding()
//
//
//        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        .background(Color.green)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//


//init 을 두기도한다.
//struct ContentView: View {
//
//    @ObservedObject var weatherVM: WeatherViewModel
//
//    init() {
//        self.weatherVM = WeatherViewModel()
//    }
//

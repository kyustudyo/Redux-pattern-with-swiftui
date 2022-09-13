//
//  Redux_patternApp.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/05/08.
//

import SwiftUI
@main
struct Redux_patternApp: App {
    init() {
        
//        SDK.doSomeWork()
    }
    var body: some Scene {
       //For now we have only one reducer
        let store = Store(reducer: appReducer, state: AppState(),
                          middlewares: [logMiddleware(),incrementMiddleware()])
        
        WindowGroup {
            ContentView().environmentObject(store)
//            Combine()
//            MusicAPIView()
//            buttons()
//            geometryReader_card()
//            ViewController()
//            TextFieldP()
//            transition()
            
        }
    }
}


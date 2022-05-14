//
//  IncrementModdileware.swift
//  Redux pattern
//
//  Created by Hankyu Lee on 2022/05/13.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
            case _ as IncrementActionAsync :
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    dispatch(IncrementAction())
                }
            default: break
        }
        
    }
}

//
//  LogMiddleware.swift
//  HelloMiddleware
//
//  Created by Mohammad Azam on 10/3/20.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        print("[LOG MIDDLEWARE]")
    }
    
}


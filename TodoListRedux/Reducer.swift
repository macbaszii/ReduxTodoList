//
//  Reducer.swift
//  TodoListRedux
//
//  Created by Kiattisak Anoochitarom on 12/1/2559 BE.
//  Copyright © 2559 Hexter. All rights reserved.
//

import Foundation
import ReSwift

struct TodoReducer: Reducer {
    typealias ReducerStateType = State
    
    func handleAction(action: Action, state: State?) -> State {
        var newState = state ?? State()
        
        switch action {
        case let addTodo as AddTodo:
            newState.items.append(addTodo.item)
        case let removeTodo as RemoveTodo:
            newState.items.remove(at: removeTodo.index)
        default:
            break
        }
        
        newState.itemCount = newState.items.count
        
        return newState
    }
}

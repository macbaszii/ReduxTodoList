//
//  Reducer.swift
//  TodoListRedux
//
//  Created by Kiattisak Anoochitarom on 12/1/2559 BE.
//  Copyright © 2559 Hexter. All rights reserved.
//

import Foundation
import ReSwift

struct TodoListReducer: Reducer {
    typealias ReducerStateType = TodoListState
    
    func handleAction(action: Action, state: TodoListState?) -> TodoListState {
        var newState = state ?? TodoListState()
        
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

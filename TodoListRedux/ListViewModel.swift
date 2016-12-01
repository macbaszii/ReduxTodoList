//
//  ListViewModel.swift
//  TodoListRedux
//
//  Created by Kiattisak Anoochitarom on 12/1/2559 BE.
//  Copyright © 2559 Hexter. All rights reserved.
//

import Foundation
import ReSwift

class ListViewModel {
    var todoState: TodoListState!
    var updateHandler: (() -> ())?
    
    init() {
        appStore.subscribe(self)
    }
    
    deinit {
        appStore.unsubscribe(self)
    }
    
    var itemCount: Int {
        return todoState.itemCount
    }
    
    func item(at index: Int) -> String {
        return todoState.items[index]
    }
    
    func addTodo() {
        appStore.dispatch(AddTodo(item: "Hello"))
    }
    
    func removeTodo(at index: Int) {
        appStore.dispatch(RemoveTodo(index: index))
    }
}

extension ListViewModel: StoreSubscriber {
    typealias StoreSubscriberStateType = TodoListState
    
    func newState(state: TodoListState) {
        todoState = state
        updateHandler?()
    }
}

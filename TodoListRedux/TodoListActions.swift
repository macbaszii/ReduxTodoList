//
//  Action.swift
//  TodoListRedux
//
//  Created by Kiattisak Anoochitarom on 12/1/2559 BE.
//  Copyright © 2559 Hexter. All rights reserved.
//

import Foundation
import ReSwift

struct AddTodo: Action {
    let item: String
}

struct RemoveTodo: Action {
    let index: Int
}

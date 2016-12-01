//
//  State.swift
//  TodoListRedux
//
//  Created by Kiattisak Anoochitarom on 12/1/2559 BE.
//  Copyright © 2559 Hexter. All rights reserved.
//

import Foundation
import ReSwift

struct State: StateType {
    var itemCount = 0
    var items = [String]()
}

//
//  Task.swift
//  Stimo
//
//  Created by Ariel Waraney on 27/07/22.
//

import Foundation
import SwiftUI
import Combine

struct TaskModel: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}

class TaskStore: ObservableObject {
    @Published var tasks = [TaskModel]()
}

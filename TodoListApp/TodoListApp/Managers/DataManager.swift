//
//  DataManager.swift
//  TodoListApp
//
//  Created by Jose Mari on 11/11/22.
//

import Foundation

protocol DataManagerProtocol {
    func fetchTaskList(includingCompleted: Bool) -> [TLTask]
    func add(task:TLTask)
    func toggleIsCompleted(for task:TLTask)
}

extension DataManagerProtocol {
    func fetchTaskList(includingCompleted: Bool = false) -> [TLTask] {
        fetchTaskList(includingCompleted: includingCompleted)
    }
}

class DataManager {

    static let shared: DataManagerProtocol = DataManager()

    private var tasks: [TLTask] = []

    private init() {}
}
extension DataManager: DataManagerProtocol {
    func fetchTaskList(includingCompleted: Bool = false) -> [TLTask] {
        includingCompleted ? tasks : tasks.filter { !$0.isCompleted }
    }

    func add(task: TLTask) {
        tasks.insert(task, at: 0)
    }

    func toggleIsCompleted(for task: TLTask) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}


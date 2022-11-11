//
//  MocksDataManager.swift
//  TodoListApp
//
//  Created by Jose Mari on 11/11/22.
//

import Foundation

class MockDataManager {
    private var tasks: [TLTask] = []
    
    init() {
        tasks = [
            TLTask(title: "Task 1"),
            TLTask(title: "Task 2"),
            TLTask(title: "Task 3"),
            TLTask(title: "Task 4"),
            TLTask(title: "Task 5"),
            TLTask(title: "Task 6"),
            TLTask(title: "Task 7"),
            TLTask(title: "Task 8"),
            TLTask(title: "Task 9"),
        ]
    }
}

extension MockDataManager: DataManagerProtocol {
    func fetchTaskList(includingCompleted: Bool) -> [TLTask] {
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

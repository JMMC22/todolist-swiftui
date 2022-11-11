//
//  TaskListView.swift
//  TodoListApp
//
//  Created by Jose Mari on 11/11/22.
//

import SwiftUI

struct TaskListView: View {
    /// "Don’t get destroyed and re-instantiated at times their containing view struct redraws"
    @StateObject var viewModel = TaskListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.tasks) { task in
                Text(task.title)
            }
            .navigationTitle(Text("Tasks"))
        }
        .onAppear {
            viewModel.fetchTasks()
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var viewModel: TaskListViewModel {
        TaskListViewModel(dataManager: MockDataManager())
    }
    static var previews: some View {
        TaskListView(viewModel: viewModel )
    }
}

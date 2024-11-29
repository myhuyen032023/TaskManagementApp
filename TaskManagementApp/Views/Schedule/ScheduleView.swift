//
//  ScheduleView.swift
//  TaskManagementApp
//
//  Created by Hoang Thi My Huyen on 8/11/24.
//

import SwiftUI
import SwiftData

@Model
class TodoTask {
    var title: String
    var createdDate: Date
    var isDone: Bool
    
    init(title: String, createdDate: Date, isDone: Bool) {
        self.title = title
        self.createdDate = createdDate
        self.isDone = isDone
    }
}

struct ScheduleView: View {
    @Environment(\.modelContext) var modelContext
    @State private var taskTitle = ""
    @State private var showAddToDoTask = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TasksView()
            }
            .navigationTitle("Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.arrowleft)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Task", systemImage: "plus.square") {
                        // MARK: Add toto Task
                        showAddToDoTask = true
                    }
                }
            }
            .sheet(isPresented: $showAddToDoTask) {
                Form {
                    TextField("Task Title", text: $taskTitle)
                    Button("Add") {
                        let task = TodoTask(title: taskTitle, createdDate: .now, isDone: false)
                        modelContext.insert(task)
                        showAddToDoTask = false
                    }
                }
            }
        }
    }
}

struct TasksView: View {
    @Query var tasks: [TodoTask]
    @Environment(\.modelContext) var modelContext
    // filter tasks with date
    var body: some View {
        ScrollView {
                //MARK: Today Tasks
                VStack(alignment: .leading, spacing: 20) {
                    if !tasks.isEmpty {
                        Text("Today's Tasks")
                            .font(.system(size: 20).weight(.semibold))
                    }
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.title)
                                .font(.system(size: 18).weight(.medium))
                            
                            Spacer()
                            
                            Button {
                                // MARK: Check task done
                                task.isDone = true
                            } label: {
                                Rectangle()
                                    .fill(.myPrimary)
                                    .frame(width: 40, height: 40)
                                    .overlay {
                                        Image(systemName: task.isDone ? "checkmark.circle": "circle")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(.black)
                                    }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 58)
                        .background(Color.secondaryBackground)
                    }
                }
        }
        .padding(20)
    }
}

#Preview {
    NavigationStack {
        ScheduleView()
            .preferredColorScheme(.dark)
    }
}

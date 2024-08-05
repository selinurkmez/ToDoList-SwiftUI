//
//  ContentView.swift
//  toDoList
//
//  Created by macbook on 5.08.2024.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct ContentView: View {
    
    @State private var task = ""
    @State private var tasks: [Task] = []
    
    var body: some View {
        VStack {
            
            TextField("Task:", text: $task)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(15)
            
            Button("Add") {
                if !task.isEmpty {
                    tasks.append(Task(title: task))
                    task = "" // Girilen görevi ekledikten sonra textfield'i temizle
                }
            }
            .padding(.vertical)
            
            Divider()
            
            Text("Tasks: \(tasks.count)")
                .padding(.top)
            
            ForEach(tasks) { item in
                HStack {
                    Text(item.title)
                        .strikethrough(item.isCompleted)
                        .padding()
                        .onTapGesture {
                            if let index = tasks.firstIndex(where: { $0.id == item.id }) {
                                tasks[index].isCompleted.toggle()
                            }
                        }
                    
                    Spacer()
                    
                    Button("Delete") {
                        if let taskIndexNo = tasks.firstIndex(where: { $0.id == item.id }) {
                            tasks.remove(at: taskIndexNo)
                        }
                    }
                    .foregroundColor(.red)
                    .padding(.trailing)
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


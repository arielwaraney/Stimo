//
//  FocusPlanView.swift
//  Stimo
//
//  Created by Ariel Waraney on 26/07/22.
//

import SwiftUI

struct FocusPlanView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    @ObservedObject var taskStore = TaskStore()
    @State private var themeColor: Color = .gray
    @State var newTask:String = ""
    @Environment(\.presentationMode) var presentMode
    
    var body: some View {
        ZStack {
            Color("\(getColorFour(color: timerModel.selectedColor))").ignoresSafeArea()
            VStack {
                Spacer(minLength: 30)
                Button(){
                    //TODO: dismiss modal view
                    presentMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color("\(getColorExeptionChevronButton(color: timerModel.selectedColor))"))
                }
                Spacer(minLength: 30)
                Text("Your Focus Plan")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color("\(getColorExeptionChevronButton(color: timerModel.selectedColor))"))
                Spacer()
                Section {
                    VStack {
                        Text("Color Theme : \(timerModel.getColorName())")
                            .font(.system(size: 14))
                        HStack {
                            //Custom Color picker
                            Spacer()
                            CustomColorPicker(selectedColors: $themeColor)
                            Spacer()
                        }
                    }
                    .padding(10)
                    .background(Color("\(getColorOne(color: timerModel.selectedColor))"))
                    .foregroundColor(Color("\(getColorTextContrast(color: timerModel.selectedColor))"))
                    .cornerRadius(10)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 10)
                .padding(.bottom, 10)
                Spacer()
                Section {
                    VStack {
                        Text("Focus Task Checklist: ")
                            .font(.system(size: 14))
                        HStack {
                            TextField("", text: self.$newTask)
                                .foregroundColor(Color("\(getColorTextContrast(color: timerModel.selectedColor))"))
                                .placeholder(when: newTask.isEmpty) {
                                    Text("Type Here...")
                                }
                                .underlineTextField(timerModel: timerModel)
                                .padding(.leading, 5)
                            Spacer(minLength: 10)
                            Button(action: self.addNewTask, label: {
                                Text("Add")
                                    .foregroundColor(Color("\(buttonAddColorLabelSame(color: timerModel.selectedColor))"))
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                    .background(Color("\(buttonAddColorContrast(color: timerModel.selectedColor))"))
                                    .cornerRadius(20)
                            })
                        }
                        
                        List {
                            ForEach($taskStore.tasks) { $task in
                                Section {
                                    HStack {
                                        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                                            .onTapGesture {
                                                task.isCompleted.toggle()
                                            }
                                        Text(task.name)
                                    }
                                }
                            }.onDelete(perform: self.delete)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(10)
                    .background(Color("\(getColorOne(color: timerModel.selectedColor))"))
                    .foregroundColor(Color("\(getColorTextContrast(color: timerModel.selectedColor))"))
                    .cornerRadius(10)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 10)
                .padding(.bottom, 10)
                Spacer()
            }
        }
    }
    
    func addNewTask() {
        taskStore.tasks.append(TaskModel(name: newTask, isCompleted: false))
        self.newTask = ""
    }
    
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct FocusPlanView_Previews: PreviewProvider {
    static var previews: some View {
        FocusPlanView().environmentObject(TimerModel())
    }
}

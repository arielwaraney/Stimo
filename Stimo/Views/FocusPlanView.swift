//
//  FocusPlanView.swift
//  Stimo
//
//  Created by Ariel Waraney on 26/07/22.
//

import SwiftUI

struct FocusPlanView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    @State var newTask:String = ""
    @Environment(\.presentationMode) var presentMode
    @StateObject var coreData = CoreDataViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
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
                            CustomColorPicker(selectedColors: $timerModel.selectedColor)
                            Spacer()
                        }
                    }
                    .padding(10)
                    .background(Color("\(getColorPalateBackground(color: timerModel.selectedColor))"))
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
                            Button(action: {
                                //MARK: Make sure the text is not empty
                                guard !newTask.isEmpty else { return }
                                //MARK: Add to core data
                                coreData.addTask(name: newTask)
                                //MARK: Set text field back to ""
                                newTask = ""
                            }, label: {
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
                            ForEach(coreData.savedEntities) { task in
                                Section {
                                    HStack {
                                        Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                                            .onTapGesture {
                                                coreData.toggleTask(entity: task)
                                            }
                                            .foregroundColor(.black)
                                        Text(task.name ?? "NO NAME")
                                            .strikethrough(coreData.isToggled(entity: task))
                                            .fontWeight(coreData.isToggled(entity: task) ? .bold : .regular)
                                    }
                                }
                                .listRowBackground(coreData.isToggled(entity: task) ? Color(.green) : Color(.white))
                            }
                            .onDelete(perform: coreData.deleteTask)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(10)
                    .background(Color("\(getColorPalateBackground(color: timerModel.selectedColor))"))
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
}

struct FocusPlanView_Previews: PreviewProvider {
    static var previews: some View {
        FocusPlanView().environmentObject(TimerModel())
    }
}

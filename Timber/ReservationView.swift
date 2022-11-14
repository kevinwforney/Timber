//
//  ReservationView.swift
//  Timber
//
//  Created by User19 on 2022/11/14.
//

import SwiftUI

struct ReservationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var party = 4
    @State private var dateTime = Date()
    @State private var name = ""
    @State private var phone = ""
    @State private var gender = false
    @State private var selectDiet = 0
    let diets = ["葷", "素"]
    @State private var hasAllergy = false
    @State private var selectAllergy = "無"
    let allergies = ["堅果", "花生", "小麥", "海鮮", "牛奶", "雞蛋"]
    @State private var message = ""
    @State private var showAlert = false
    @State var showConfirmation = false
    
    var body: some View {
        VStack {
            Form {
                Group {
                    Text("Reserve")
                        .font(Font.custom("CaviarDreams", size: 50))
                    HStack {
                        Text("人數: ")
                        Stepper("\(party) 人", value: $party, in: 1...8)
                    }
                    DatePicker("日期: ", selection: $dateTime)
                    HStack {
                        Text("貴姓: ")
                        TextField("貴姓", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text(gender ? "先生" : "小姐")
                        Button {
                            gender.toggle()
                        } label:{
                            Image(gender ? "man" : "woman")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                        }
                    }
                    HStack {
                        Text("電話: ")
                        TextField("電話號碼", text: $phone)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        Text("飲食調查: ")
                            Picker(selection: $selectDiet, label: Text("飲食")) {
                                Text(diets[0]).tag(0)
                                Text(diets[1]).tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                    }
                    Toggle("過敏調查: ", isOn: $hasAllergy)
                    if hasAllergy {
                        Picker(selection: $selectAllergy, label: Text("過敏")) {
                            ForEach(allergies, id: \.self) { allergy in
                            Text(allergy)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    HStack {
                        Text("留言: ")
                        TextEditor(text: $message)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    }
                }
                Button {
                    if (phone.isEmpty) {
                        showAlert = true
                    } else {
                        showConfirmation = true
                    }
                } label: {
                    Label("提交", systemImage: "square.and.arrow.up")
                }
                .sheet(isPresented: $showConfirmation) {
                    ConfirmationView(party: $party, dateTime: $dateTime, name: $name, phone: $phone, gender: $gender, selectDiet: $selectDiet, hasAllergy: $hasAllergy, selectAllergy: $selectAllergy, message: $message, showConfirmation: $showConfirmation)
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Label("取消", systemImage: "xmark")
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("請輸入電話號碼"))
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}

struct ConfirmationView: View {
    @Binding var party: Int
    @Binding var dateTime: Date
    @Binding var name: String
    @Binding var phone: String
    @Binding var gender: Bool
    @Binding var selectDiet: Int
    let diets = ["葷", "素"]
    @Binding var hasAllergy: Bool
    @Binding var selectAllergy: String
    @Binding var message: String
    @Binding var showConfirmation: Bool
    @State private var showingOptions = false
    @State private var selection = "None"
    @State private var showAlert = false
    var body: some View {
        Form {
            Group {
              Text("Confirmation")
                  .font(Font.custom("CaviarDreams", size: 50))
              Text("\(name)") + Text(gender ? "先生" : "小姐")
                  + Text(", 請確認預訂")
              HStack {
                  Text("人數: ")
                  Text("\(party) 人")
              }
              HStack {
                  Text("電話: ")
                  Text(phone)
              }
              HStack {
                  Text("日期: ")
                  Text(dateTime, style: .date)
              }
              HStack {
                  Text("時間: ")
                  Text(dateTime, style: .time)
              }
              HStack {
                  Text("飲食: ")
                  Text(diets[selectDiet])
              }
              HStack {
                  Text("過敏: ")
                  Text(hasAllergy ? selectAllergy : "無")
              }
              HStack {
                  Text("留言: ") + Text(message)
                  if message == "" {
                      Text("無")
                  }
              }
            }
            Button {
                showingOptions = true
            } label: {
                Label("提交", systemImage: "square.and.arrow.up")
            }
            .actionSheet(isPresented: $showingOptions) {
                ActionSheet(
                    title: Text("Options:"),
                    buttons: [
                        .default(Text("返回")) {
                            showConfirmation = false
                        },
                        .default(Text("送出")) {
                            showAlert = true
                        },
                        .cancel(Text("取消"))
                    ]
                )
            }
            Button {
                showConfirmation = false
            } label: {
                Label("返回", systemImage: "return")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("送出成功"))
        }
    }
}

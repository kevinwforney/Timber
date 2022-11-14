//
//  MenuView.swift
//  Timber
//
//  Created by User19 on 2022/11/13.
//

import SwiftUI

struct Cuisine: Identifiable {
    let id = UUID()
    let origin: String
    let flag: String
    let foods: [Food]
}

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showSheet = false
    @State var foods = Food.data
    @State private var foodID = Int.random(in: 1...43)
    //@State private var isExpanded = true
    let western = [
        Cuisine(origin: "法式", flag: "french", foods: [
            Food(name: "普羅旺斯雜燴", image: "ratatouille", no: 1)
        ]),
        Cuisine(origin: "匈式", flag: "hungarian", foods: [
            Food(name: "燉牛湯", image: "goulash", no: 2)
        ]),
        Cuisine(origin: "義式", flag: "italian", foods: [
            Food(name: "義大利麵", image: "pasta", no: 3),
            Food(name: "義大利長麵", image: "spaghetti", no: 4),
            Food(name: "千層麵", image: "lasagna", no: 5),
            Food(name: "比薩", image: "pizza", no: 6),
            Food(name: "布魯斯凱塔", image: "bruschetta", no: 7)
        ]),
        Cuisine(origin: "西班牙", flag: "spanish", foods: [
            Food(name: "西班牙海鮮飯", image: "paella", no: 8),
            Food(name: "恩潘納達", image: "empanada", no: 9),
            Food(name: "西班牙油條", image: "churros", no: 10),
            Food(name: "塔帕斯", image: "tapas", no: 11)
        ]),
        Cuisine(origin: "烏克蘭", flag: "ukrainian", foods: [
            Food(name: "羅宋湯", image: "borscht", no: 12)
        ]),
        Cuisine(origin: "瑞士", flag: "swiss", foods: [
            Food(name: "起司火鍋", image: "fondue", no: 13)
        ]),
        Cuisine(origin: "德式", flag: "german", foods: [
            Food(name: "椒鹽捲餅", image: "pretzel", no: 14)
        ]),
        Cuisine(origin: "美式", flag: "american", foods: [
            Food(name: "漢堡", image: "burger", no: 15),
            Food(name: "熱狗", image: "hot dog", no: 16),
            Food(name: "烤奶酪三明治", image: "grilled cheese", no: 17),
            Food(name: "甜甜圈", image: "donut", no: 18),
            Food(name: "夏威夷蓋飯", image: "poke", no: 19)
        ]),
        Cuisine(origin: "英式", flag: "english", foods: [
            Food(name: "炸魚薯條", image: "fish n chips", no: 20)
        ]),
        Cuisine(origin: "加拿大", flag: "canadian", foods: [
            Food(name: "起司澆肉汁馬鈴薯條", image: "poutine", no: 21)
        ]),
        Cuisine(origin: "墨式", flag: "mexican", foods: [
            Food(name: "塔可餅", image: "taco", no: 22),
            Food(name: "墨式玉米片", image: "nachos", no: 23),
            Food(name: "酪梨醬", image: "guacamole", no: 24)
        ]),
        Cuisine(origin: "巴西", flag: "brazil", foods: [
            Food(name: "炸丸子", image: "coxinha", no: 25)
        ]),
        Cuisine(origin: "埃及", flag: "egypt", foods: [
            Food(name: "油炸鷹嘴豆餅", image: "falafel", no: 26)
        ])
    ]
    let eastern = [
        Cuisine(origin: "中式", flag: "chinese", foods: [
            Food(name: "海南雞飯", image: "chicken rice", no: 27),
            Food(name: "春捲", image: "spring rolls", no: 28),
            Food(name: "小籠包", image: "dim sum", no: 29)
        ]),
        Cuisine(origin: "日式", flag: "japanese", foods: [
            Food(name: "拉麵", image: "ramen", no: 30),
            Food(name: "壽司", image: "sushi", no: 31),
            Food(name: "麻糬", image: "mochi", no: 32)
        ]),
        Cuisine(origin: "韓式", flag: "korean", foods: [
            Food(name: "拌飯", image: "bibimbap", no: 33),
            Food(name: "泡菜", image: "kimchi", no : 34),
            Food(name: "炒年糕", image: "tteokbokki", no: 35)
        ]),
        Cuisine(origin: "台式", flag: "taiwan", foods: [
            Food(name: "珍珠奶茶", image: "boba", no: 36)
        ]),
        Cuisine(origin: "印度", flag: "indian", foods: [
            Food(name: "瑪撒拉香料捲餅", image: "masala dosa", no: 37),
            Food(name: "咖哩飯", image: "curry", no: 38),
            Food(name: "印度沾醬", image: "chutney", no: 39)
        ]),
        Cuisine(origin: "泰式", flag: "thai", foods: [
            Food(name: "冬蔭", image: "tom yum", no: 40),
            Food(name: "炒金邊粉", image: "pad thai", no: 41)
        ]),
        Cuisine(origin: "印尼", flag: "indo", foods: [
            Food(name: "炒飯", image: "nasi goreng", no: 42),
            Food(name: "沙爹", image: "sate", no: 43)
        ])
    ]
    var body: some View {
        ZStack {
            //Color.yellow
            VStack {
                Form {
                    Text("Menu")
                        .font(Font.custom("CaviarDreams", size: 50))
                    DisclosureGroup {
                        ForEach(western, id: \.id) { cuisine in
                            DisclosureGroup {
                                ForEach(cuisine.foods, id: \.id) { food  in
                                    FoodRow(food: food)
                                }
                            } label: {
                                CuisineLabel(cuisine: cuisine)
                            }
                        }
                    } label: {
                        Label("西洋", systemImage: "globe")
                    }
                    DisclosureGroup {
                        ForEach(eastern, id: \.id) { cuisine in
                            DisclosureGroup {
                                ForEach(cuisine.foods, id: \.id) { food  in
                                    FoodRow(food: food)
                                }
                            } label: {
                                CuisineLabel(cuisine: cuisine)
                            }
                        }
                    } label: {
                        Label("東方", systemImage: "globe")
                    }
                    Button {
                        showSheet = true
                        self.foodID = Int.random(in: 1...43)
                    } label: {
                        Label("隨機推薦一個料理", systemImage: "hand.thumbsup")
                    }
                    .sheet(isPresented: $showSheet) {
                        SheetView(showSheet: $showSheet, foods: $foods)
                    }
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("返回", systemImage: "return")
                    }
                }
                //.onAppear {
                //    UITableView.appearance().backgroundColor = .clear
                //}
                //.onDisappear {
                //    UITableView.appearance().backgroundColor = .systemGroupedBackground
                //}
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
      MenuView().preferredColorScheme(.dark)
    }
}

struct CuisineLabel: View {
    let cuisine: Cuisine
    var body: some View {
        HStack {
            Image(cuisine.flag)
                .resizable()
                .frame(width: 22, height: 22)
            Text(cuisine.origin)
        }
    }
}

struct SheetView: View {
    @Binding var showSheet: Bool
    @Binding var foods: [Food]
    @State var foodID = Int.random(in: 1...43)
    @State var face: Double = 4
    @State var faceImg: String = "expression4"
    var body: some View {
        VStack {
            HStack {
                Text("Recommend")
                  .font(Font.custom("CaviarDreams", size: 50))
                Spacer()
            }
            .padding(.leading)
            Spacer()
            ZStack {
                Color(.orange)
                    .frame(width: 300, height: 300)
                    .mask(Image("mask")
                            .resizable())
                Image(foods[foodID].image)
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            Text(foods[foodID].name)
                .font(.largeTitle)
            Text(foods[foodID].image.capitalized)
                .font(Font.custom("CaviarDreams", size: 30))
            HStack {
                Slider(value: $face, in: 0...5, step: 1)
                Image(faceImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .onChange(of: face, perform: { value in
                        switch face {
                        case 0:
                            faceImg = "expression0"
                        case 1:
                            faceImg = "expression1"
                        case 2:
                            faceImg = "expression2"
                        case 3:
                            faceImg = "expression3"
                        case 4:
                            faceImg = "expression4"
                        case 5:
                            faceImg = "expression5"
                        default:
                            faceImg = "expression5"
                        }
                    })
            }
            .padding(.all)
            Spacer()
            HStack {
                Button {
                    self.foodID = Int.random(in: 1...43)
                } label: {
                    Label("看其他的", systemImage: "hand.thumbsup")
                }
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Label("返回", systemImage: "return")
                }
            }
            .padding(.horizontal)
        }
    }
}

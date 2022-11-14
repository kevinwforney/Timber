//
//  Food.swift
//  Timber
//
//  Created by User19 on 2022/11/13.
//

import Foundation

struct Food: Identifiable {
  let id = UUID()
  let name: String
  let image: String
  var no: Int
}

extension Food {
    static var data: [Food] {
        [
            Food(name: "普羅旺斯雜燴", image: "ratatouille", no: 1),
            Food(name: "燉牛湯", image: "goulash", no: 2),
            Food(name: "義大利麵", image: "pasta", no: 3),
            Food(name: "義大利麵", image: "pasta", no: 3),
            Food(name: "義大利長麵", image: "spaghetti", no: 4),
            Food(name: "千層麵", image: "lasagna", no: 5),
            Food(name: "比薩", image: "pizza", no: 6),
            Food(name: "布魯斯凱塔", image: "bruschetta", no: 7),
            Food(name: "西班牙海鮮飯", image: "paella", no: 8),
            Food(name: "恩潘納達", image: "empanada", no: 9),
            Food(name: "西班牙油條", image: "churros", no: 10),
            Food(name: "塔帕斯", image: "tapas", no: 11),
            Food(name: "羅宋湯", image: "borscht", no: 12),
            Food(name: "起司火鍋", image: "fondue", no: 13),
            Food(name: "椒鹽捲餅", image: "pretzel", no: 14),
            Food(name: "漢堡", image: "burger", no: 15),
            Food(name: "熱狗", image: "hot dog", no: 16),
            Food(name: "烤奶酪三明治", image: "grilled cheese", no: 17),
            Food(name: "甜甜圈", image: "donut", no: 18),
            Food(name: "夏威夷蓋飯", image: "poke", no: 19),
            Food(name: "炸魚薯條", image: "fish n chips", no: 20),
            Food(name: "起司澆肉汁馬鈴薯條", image: "poutine", no: 21),
            Food(name: "塔可餅", image: "taco", no: 22),
            Food(name: "墨式玉米片", image: "nachos", no: 23),
            Food(name: "酪梨醬", image: "guacamole", no: 24),
            Food(name: "炸丸子", image: "coxinha", no: 25),
            Food(name: "油炸鷹嘴豆餅", image: "falafel", no: 26),
            Food(name: "海南雞飯", image: "chicken rice", no: 27),
            Food(name: "春捲", image: "spring rolls", no: 28),
            Food(name: "小籠包", image: "dim sum", no: 29),
            Food(name: "拉麵", image: "ramen", no: 30),
            Food(name: "壽司", image: "sushi", no: 31),
            Food(name: "麻糬", image: "mochi", no: 32),
            Food(name: "拌飯", image: "bibimbap", no: 33),
            Food(name: "泡菜", image: "kimchi", no : 34),
            Food(name: "炒年糕", image: "tteokbokki", no: 35),
            Food(name: "珍珠奶茶", image: "boba", no: 36),
            Food(name: "瑪撒拉香料捲餅", image: "masala dosa", no: 37),
            Food(name: "咖哩飯", image: "curry", no: 38),
            Food(name: "印度沾醬", image: "chutney", no: 39),
            Food(name: "冬蔭", image: "tom yum", no: 40),
            Food(name: "炒金邊粉", image: "pad thai", no: 41),
            Food(name: "炒飯", image: "nasi goreng", no: 42),
            Food(name: "沙爹", image: "sate", no: 43)
        ]
    }
}

//
//  FoodRow.swift
//  Timber
//
//  Created by User19 on 2022/11/13.
//

import SwiftUI

struct FoodRow: View {
    let food: Food
    var body: some View {
        HStack() {
            ZStack {
                Color(.orange)
                    .frame(width: 75, height: 75)
                    .mask(Image("mask")
                        .resizable())
                Image(food.image)
                    .resizable()
                    .frame(width: 75, height: 75)
            }
            Text(food.name)
                .font(.title2)
                .contextMenu(ContextMenu(menuItems: {
                    Text("#\(food.no) ") + Text(food.name)
                    Text(food.image.capitalized)
                    Button {
                        print("Close")
                    } label: {
                        Label("關閉", systemImage: "xmark")
                    }
                }))
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: Food(name: "普羅旺斯雜燴", image: "ratatouille", no: 1))
          .previewLayout(.sizeThatFits)
    }
}

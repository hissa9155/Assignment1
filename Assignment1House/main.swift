//
//  main.swift
//  Assignment1
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

let houses = [
  House(size: -5),
  House(size: 7, border: "^"),
  House(size: 12, border: "W", fill: "o"),
  House(size: 50, border: "$", fill: "-")
]

for i in 0...3 {
  print(houses[i])
  print("House looks like: ")
  houses[i].draw()
  print()
}

houses[0].shrink()
houses[1].shrink()
houses[2].grow()

print("================== TESTING GROW =====================")
let h1 = houses[0]
print(h1)
h1.draw()
for _ in 0..<2 {
  print("\nGrowing...")
  h1.grow()
  print(h1)
  h1.draw()
}

print("================== TESTING SHRINK =====================")
for _ in 0..<3 {
  print("\nShrinking...")
  h1.shrink()
  print(h1)
  h1.draw()
}

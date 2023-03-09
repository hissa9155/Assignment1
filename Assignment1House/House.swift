//
//  House.swift
//  Assignment1
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

class House: CustomStringConvertible {
  
  //------------------------------------------------
  // Properties
  //------------------------------------------------
  private let DEF_BORDER:Character = "X"
  private let DEF_FILL:Character = "*"
  private let MIN_SIZE = 3
  private let MAX_SIZE = 37
  private let OVERHANG_LENGTH = 1
  
  var border: Character = "X"
  var fill: Character = "*"
  private(set) var size: Int = 3
  
  var description: String {
    return """
    House width and height base to roof = \(size) units.
    Perimeter of house = \(perimeter) units.
    Area of house = \(round(area * 100)/100) units.
    """
  }
  
  private var triangleLength: Int {
    return size + OVERHANG_LENGTH * 2
  }
  
  private var length2Center: Int {
    return size + OVERHANG_LENGTH + 1
  }
  
  
  //-----------------------------------------
  // Methods
  //-----------------------------------------
  
  init(size: Int, border: Character = "X", fill: Character = "*") {
    self.size = self.getValidSize(size: size)
    self.border = border
    self.fill = fill
  }
  
  var perimeter: Int {
    return (size * 3) + (triangleLength * 2) + (OVERHANG_LENGTH * 2)
  }
  
  var area: Double {
    return pow(Double(triangleLength), 2) * sqrt(3.0) / 4 + pow(Double(size), 2)
  }
  
  func grow() {
    self.size = getValidSize(size: self.size + 1)
  }
  
  func shrink() {
    self.size = getValidSize(size: self.size - 1)
  }
  
  func draw() {
    drawTriangle()
    drawSquare()
  }
  
  
  // ------------------------------------------------
  // Private methods
  // ------------------------------------------------
  private func getValidSize(size: Int) -> Int {
    var _size:Int
    if size < MIN_SIZE {
      _size = MIN_SIZE
    } else if MAX_SIZE < size {
      _size = MAX_SIZE
    } else {
      _size = size
    }
    
    return _size
  }
  
  private func drawTriangle() {
    let length2Center = self.length2Center
    for step in 1...triangleLength {
      let startPosition2Print = length2Center - step + 1
      
      for _ in 1..<startPosition2Print {
        print(" ", terminator: "")
      }
      
      // the first step
      if step == 1 {
        print("\(border)")
        continue
      } else {
        print("\(border) ", terminator: "")
        
        // print fill
        if step >= 3 {
          for _ in 1...(step - 2) {
            print("\(fill) ", terminator: "")
          }
        }
        
        print("\(border)")
      }
    }
  }
  
  private func drawSquare() {
    
    for step in 1...(size - 1) {
      
      for _ in 1...(OVERHANG_LENGTH + 1) {
        print(" ", terminator: "")
      }
      
      // the last step
      if step == size - 1 {
        for _ in 1...size {
          print("\(border) ", terminator: "")
        }
        print("")
      } else {
        print("\(border) ", terminator: "")
        
        // print fill
        for _ in 1...(size - 2) {
          print("\(fill) ", terminator: "")
        }
        print("\(border)")
      }
    }
  }
}

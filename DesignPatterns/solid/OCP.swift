//
//  OCP.swift
//  DesignPatterns
//
//  Created by Irvin  Castellanos on 1/10/18.
//  Copyright © 2018 Innku. All rights reserved.
//

// Open Close Pattern
import Foundation

enum Color {
  case blue
  case red
  case white
}

enum Size {
  case small
  case medium
  case large
}

class Book: CustomStringConvertible {
  var name: String
  var color: Color
  var size: Size
  
  init(name: String, color: Color, size: Size) {
    self.name = name
    self.color = color
    self.size = size
  }
  
  var description: String {
    return "Book: \(name) \(color) \(size)"
  }
}

class BookFilter {
 
  func filter(books: [Book], _ isValid: (Book) -> Bool) -> [Book] {
    return books.filter({ isValid($0) })
  }
  
}

struct OCPTest {
  public static func run() {
    let books = [
      Book(name: "Maths", color: .blue, size: .large),
      Book(name: "Computer Science", color: .red, size: .medium),
      Book(name: "Algebra", color: .red, size: .medium),
      Book(name: "English", color: .blue, size: .small),
    ]
    
    let filter = BookFilter()
    let redBooks = filter.filter(books: books, { $0.color == .red })
    let blueBooks = filter.filter(books: books, { $0.color == .blue })
    let mediumBooks = filter.filter(books: books, { $0.size == .medium })
    
    redBooks.forEach({ print("-> \($0)") })
    blueBooks.forEach({ print("-> \($0)") })
    mediumBooks.forEach({ print("-> \($0)") })
  }
}

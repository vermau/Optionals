import Foundation

enum cardError: Error {
    case overQuota
}

class Person {
    let name: String
    var libraryCard: LibraryCard?
    
    init(name: String) {
        self.name = name
    }
}

class LibraryCard {
    var itemsBorrowed = [LibraryItem]()
    
    var totalItemsBorrowed: Int {
        get { return itemsBorrowed.count }
    }
    
    var lastItemBorrowed: LibraryItem? {
        return itemsBorrowed.last
    }
    
    func addItem(item: LibraryItem) throws -> LibraryItem {
        guard totalItemsBorrowed < 2 else {
            throw cardError.overQuota
        }
        
        // :In case no error is thrown
        itemsBorrowed.append(item)
        return item
    }
}

class LibraryItem {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

class Book: LibraryItem {
    let author: String
    
    init(title: String, author: String) {
        self.author = author
        super.init(title: title)
    }
}

class Movie: LibraryItem {
    let director: String
    
    init(title: String, director: String) {
        self.director = director
        super.init(title: title)
    }
}

var catalog = [
    Book(title: "John Wick", author: "Gary Smith"),
    Book(title: "Jungle Book", author: "Martin Luther"),
    Book(title: "Good Mentorship", author: "Darby Collins"),
    Book(title: "Around The World In Eighty Days", author: "Samuel Samson"),
    Movie(title: "Enter The Dragon", director: "Hayley Brown"),
    Movie(title: "Sholey", director: "Ramesh Sippy"),
    Movie(title: "The Expandables", director: "Tom Hanks")
]

let john = Person(name: "John")
let peter = Person(name: "Peter")
john.libraryCard = LibraryCard()

for item in catalog {
    if let item = item as? Book {
        print("Book: \(item.title)")
    } else if let item = item as? Movie {
        print("Movie: \(item.title)")
    }
}

print()
print("*******************")
print()

// :Using Optional Binding with Try. If the error is thrown, the result is NIL and ELSE BLOCK is executed
if let item = try? john.libraryCard?.addItem(item: catalog[4]) {
    if let item = item as? Book {
        print("\(john.name) has borrowed a book: \(item.title)")
    } else if let item = item as? Movie {
        print("\(john.name) has borrowed a movie: \(item.title)")
    }
} else {
    print("Can not borrow more than two items at a time")
}

if let item = try? john.libraryCard?.addItem(item: catalog[1]) {
    if let item = item as? Book {
        print("\(john.name) has borrowed a book: \(item.title)")
    } else if let item = item as? Movie {
        print("\(john.name) has borrowed a movie: \(item.title)")
    }
} else {
    print("Can not borrow more than two items at a time")
}

if let item = try? john.libraryCard?.addItem(item: catalog[6]) {
    if let item = item as? Book {
        print("\(john.name) has borrowed a book: \(item.title)")
    } else if let item = item as? Movie {
        print("\(john.name) has borrowed a movie: \(item.title)")
    }
} else {
    print("Can not borrow more than two items at a time")
}

// :Using Optional Binding and Optional Chaining together
if let itemsBorrowed = john.libraryCard?.totalItemsBorrowed {
    print("\(john.name) has borrowed \(itemsBorrowed) items")
} else {
    print("\(john.name) does not have a library card")
}

// :Using Optional Binding and Optional Chaining together on Properties
if let itemsBorrowed = peter.libraryCard?.totalItemsBorrowed {
    print("\(peter.name) has borrowed \(itemsBorrowed) items")
} else {
    print("\(peter.name) does not have a library card")
}

// :Optional Binding and Multiple Optional Chaining together on Properties
if let title = john.libraryCard?.lastItemBorrowed?.title {
    print("Last item borrowed by \(john.name) was \(title)")
} else {
    print("\(john.name) has not borrowed any item")
}

/*
 // :Using Optional Chaining with a Method call having return type as Void
 if (john.libraryCard?.addBook(book: book1)) != nil {
 print("\(john.name) has borrowed: \(book1.title)")
 } else {
 print("\(john.name) does not have a library card, so can not borrow books")
 }
 
 if (john.libraryCard?.addBook(book: book3)) != nil {
 print("\(john.name) has borrowed: \(book3.title)")
 } else {
 print("\(john.name) does not have a library card, so can not borrow books")
 }
 
 // :Using Optional Chaining in assignment
 if (peter.libraryCard?.totalBooksBorrowed = 2) != nil {
 print("\(peter.name) has borrowed \(peter.libraryCard!.totalBooksBorrowed) books")
 } else {
 print("\(peter.name) does not have a library card")
 }
 */



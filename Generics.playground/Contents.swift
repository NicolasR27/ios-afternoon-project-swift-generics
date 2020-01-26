import Foundation



struct CountedSet<Element: Hashable> {

     private var dict: [Element: Int] = [:]
    var count: Int {
        return dict.count
    }
    var isEmpty: Bool {
        return count == 0
    }

     mutating func insert(_ item: Element) {
        if dict.keys.contains(item) {
            if let number = dict[item] {
                dict[item] = number + 1
            }
        } else {
            dict[item] = 1
        }
    }

     mutating func remove(_ item: Element) {

         if let quantity = dict[item],
            quantity > 1 {
            dict[item] = quantity - 1
        } else {
            dict.removeValue(forKey: item)
        }
    }

     func contains(_ item: Element) -> Bool {
        return dict.keys.contains(item)
    }

     subscript(_ member: Element) -> Int {
        if let quantity = dict[member] {
            return quantity
        } else {
            return 0
        }
    }
}

 extension CountedSet: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element

     init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}

 

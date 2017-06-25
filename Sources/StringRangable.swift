import Foundation

protocol StringRangable {
    
    var string: String { get }
    
    var range: Range<String.Index> { get }
    
    var nsRange: NSRange { get }
}

extension String: StringRangable {
    
    var string: String { return self }
}

extension NSAttributedString: StringRangable {}

extension StringRangable {
    
    var range: Range<String.Index> {
        
        return self.string.startIndex..<self.string.endIndex
    }
    
    var nsRange: NSRange {
        
        return self.range.toNSRange(in: self.string)
    }
}

extension Range where Bound == String.Index {
    
    func toNSRange(in string: String) -> NSRange {
        
        return NSRange(string.utf16Offset(fromIndex: self.lowerBound)..<string.utf16Offset(fromIndex: self.upperBound))
    }
}

extension NSRange {
    
    func toRange(in string: String) -> Range<String.Index>? {
        
        guard
            let start = string.index(of: self.lowerBound),
            let end = string.index(of: self.upperBound) else {
                
                return nil
        }
        
        return start..<end
    }
}

extension String {
    
    func index(of utf16ViewOffset: Int) -> String.Index? {
        
        return String.UTF16View.Index(utf16ViewOffset).samePosition(in: self)
    }
    
    func utf16Offset(fromIndex index: String.Index) -> Int {
        
        return self.utf16.startIndex.distance(to: index.samePosition(in: self.utf16))
    }
}

import Foundation

public struct AttributesRender<Value> {
    
    public let value: Value
    
    public init(_ value: Value) { self.value = value }
}

public protocol AttributedNamespace {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributedNamespace {
    
    public var rs: AttributesRender<Self> { return AttributesRender<Self>(self) }
}

extension String: AttributedNamespace {}

extension NSAttributedString: AttributedNamespace {}

extension String {
    
    var range: Range<String.Index> {
        return self.startIndex..<self.endIndex
    }
}

extension NSAttributedString {
    
    var range: Range<String.Index> {
        return self.string.startIndex..<self.string.endIndex
    }
}

extension AttributesRender where Value == String {
    
    public func rendered(by builder: AttributesBuilder) -> NSAttributedString {
        
        return self.value.rs.rendered(by: builder, ranges: self.value.range)
    }
    
    public func rendered(by builder: AttributesBuilder, ranges: Range<String.Index>...) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, ranges: ranges)
    }
    
    public func rendered(by builder: AttributesBuilder, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, regexPattern: regexPattern, options: options)
    }
}

extension AttributesRender where Value: NSAttributedString {
    
    public func rendered(by builder: AttributesBuilder) -> NSAttributedString {
        
        return self.rendered(by: builder, ranges: self.value.range)
    }
    
    public func rendered(by builder: AttributesBuilder, ranges: Range<String.Index>...) -> NSAttributedString {
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    public func rendered(by builder: AttributesBuilder, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        guard
            let regex = try? NSRegularExpression(pattern: regexPattern, options: options),
            let nsRange = NSRange(self.value.range, in: self.value.string) else {
                
                return self.value
        }
        
        let results = regex.matches(in: self.value.string, options: [], range: nsRange)
        
        guard !results.isEmpty else { return self.value }
        
        let ranges = results.flatMap { Range($0.range, in: self.value.string) }
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    private func rendered(by builder: AttributesBuilder, ranges: [Range<String.Index>] = []) -> NSAttributedString {
        
        guard !ranges.isEmpty else { return self.value }
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
        let attributes = builder.storage
        
        ranges.forEach {
            
            if let r = NSRange(self.value.range.clamped(to: $0), in: self.value.string) {
                
                s.addAttributes(attributes, range: r)
            }
        }
        
        return s
    }
}

import Foundation

public final class AttributesBuilderValueWrapper<Value> {
    
    public let value: Value
    
    public required init(_ value: Value) {
        self.value = value
    }
}

public protocol AttributesBuilderNamespaceWrappable {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributesBuilderNamespaceWrappable {
    
    public var rs: AttributesBuilderValueWrapper<Self> {
        return AttributesBuilderValueWrapper<Self>(self)
    }
}

extension String: AttributesBuilderNamespaceWrappable {}

extension NSAttributedString: AttributesBuilderNamespaceWrappable {}

extension AttributesBuilderValueWrapper where Value == String {
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, range: range)
    }
    
    public func rendered(by builder: AttributesBuilder, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, regexPattern: regexPattern, options: options)
    }
}

extension AttributesBuilderValueWrapper where Value: NSAttributedString {
    
    public func rendered(by builder: AttributesBuilder, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        guard let regex = try? NSRegularExpression(pattern: regexPattern, options: options) else { return self.value }
        
        let results = regex.matches(in: self.value.string, options: [], range: self.value.string.fullNSRange)
        
        guard !results.isEmpty else { return self.value }
        
        let ranges = results.map { $0.range.toCountableRange() }
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let ranges: [CountableRange<Int>] = [range ?? self.value.string.fullRange]
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    func rendered(by builder: AttributesBuilder, ranges: [CountableRange<Int>] = []) -> NSAttributedString {
        
        guard !ranges.isEmpty else { return self.value }
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
//        let fullRange = self.value.string.fullRange
//        
//        ranges.forEach { range in
//            s.addAttributes(builder.attributes, range: NSRange.from(countableRange: fullRange.clamped(to: range)))
//        }
        
        return s
    }
}

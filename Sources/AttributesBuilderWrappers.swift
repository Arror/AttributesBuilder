import Foundation

public final class AttributesBuilderWrapper<Value> {
    
    public let value: Value
    
    public required init(_ value: Value) {
        self.value = value
    }
}

public protocol AttributesBuilderNamespace {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributesBuilderNamespace {
    
    public var rs: AttributesBuilderWrapper<Self> {
        return AttributesBuilderWrapper<Self>(self)
    }
}

extension String: AttributesBuilderNamespace {}

extension NSAttributedString: AttributesBuilderNamespace {}

extension AttributesBuilderWrapper where Value == String {
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, range: range)
    }
    
    public func rendered(by builder: AttributesBuilder, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: builder, regexPattern: regexPattern, options: options)
    }
}

extension AttributesBuilderWrapper where Value: NSAttributedString {
    
    public func rendered(by builder: AttributesBuilder, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        guard let regex = try? NSRegularExpression(pattern: regexPattern, options: options) else { return self.value }
        
        let results = regex.matches(in: self.value.string, options: [], range: self.value.string.fullNSRange)
        
        guard !results.isEmpty else { return self.value }
        
        let ranges = results.map { $0.range.countableRange }
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    public func rendered(by builder: AttributesBuilder, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let ranges: [CountableRange<Int>] = [range ?? self.value.string.fullCountableRange]
        
        return self.rendered(by: builder, ranges: ranges)
    }
    
    func rendered(by builder: AttributesBuilder, ranges: [CountableRange<Int>] = []) -> NSAttributedString {
        
        guard !ranges.isEmpty else { return self.value }
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
        let fullRange = self.value.string.fullCountableRange
        
        ranges.forEach { range in
            s.addAttributes(builder.attributes, range: fullRange.clamped(to: range).nsRange)
        }
        
        return s
    }
}

import Foundation

public struct AttributedValueWrapper<Value> {
    
    public let value: Value
    
    public init(_ value: Value) { self.value = value }
}

public protocol AttributedNamespace {
    
    associatedtype Namespace
    
    var rs: Namespace { get }
}

extension AttributedNamespace {
    
    public var rs: AttributedValueWrapper<Self> { return AttributedValueWrapper<Self>(self) }
}

extension String: AttributedNamespace {}

extension NSAttributedString: AttributedNamespace {}

extension AttributedValueWrapper where Value == String {
    
    public func rendered<Container: AttributesContainer>(by container: Container, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: container, range: range)
    }
    
    public func rendered<Container: AttributesContainer>(by container: Container, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: container, regexPattern: regexPattern, options: options)
    }
}

extension AttributedValueWrapper where Value: NSAttributedString {
    
    public func rendered<Container: AttributesContainer>(by container: Container, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        guard let regex = try? NSRegularExpression(pattern: regexPattern, options: options) else { return self.value }
        
        let results = regex.matches(in: self.value.string, options: [], range: self.value.string.fullNSRange)
        
        guard !results.isEmpty else { return self.value }
        
        let ranges = results.map { $0.range.countableRange }
        
        return self.rendered(by: container, ranges: ranges)
    }
    
    public func rendered<Container: AttributesContainer>(by container: Container, range: CountableRange<Int>? = nil) -> NSAttributedString {
        
        let ranges: [CountableRange<Int>] = [range ?? self.value.string.fullCountableRange]
        
        return self.rendered(by: container, ranges: ranges)
    }
    
    func rendered<Container: AttributesContainer>(by container: Container, ranges: [CountableRange<Int>] = []) -> NSAttributedString {
        
        guard !ranges.isEmpty else { return self.value }
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
        let fullRange = self.value.string.fullCountableRange
        
        let attributes = container.build()
        
        ranges.forEach { s.addAttributes(attributes, range: fullRange.clamped(to: $0).nsRange) }
        
        return s
    }
}

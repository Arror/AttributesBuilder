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
    
    public func rendered<Container: AttributesContainer>(by container: Container) -> NSAttributedString {
        
        return self.value.rs.rendered(by: container, ranges: self.value.range)
    }
    
    public func rendered<Container: AttributesContainer>(by container: Container, ranges: Range<String.Index>...) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        let rs = ranges
        
        return s.rs.rendered(by: container, ranges: rs)
    }
    
    public func rendered<Container: AttributesContainer>(by container: Container, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        let s = NSAttributedString(string: self.value)
        
        return s.rs.rendered(by: container, regexPattern: regexPattern, options: options)
    }
}

extension AttributedValueWrapper where Value: NSAttributedString {
    
    public func rendered<Container: AttributesContainer>(by container: Container) -> NSAttributedString {
        
        return self.rendered(by: container, ranges: [self.value.range])
    }
    
    public func rendered<Container: AttributesContainer>(by container: Container, ranges: Range<String.Index>...) -> NSAttributedString {
        
        return self.rendered(by: container, ranges: ranges)
    }
    
    public func rendered<Container: AttributesContainer>(by container: Container, regexPattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        
        guard let regex = try? NSRegularExpression(pattern: regexPattern, options: options) else { return self.value }
        
        let results = regex.matches(in: self.value.string, options: [], range: self.value.nsRange)
        
        guard !results.isEmpty else { return self.value }
        
        let ranges = results.flatMap { $0.range.toRange(in: self.value.string) }
        
        return self.rendered(by: container, ranges: ranges)
    }
    
    private func rendered<Container: AttributesContainer>(by container: Container, ranges: [Range<String.Index>] = []) -> NSAttributedString {
        
        guard !ranges.isEmpty else { return self.value }
        
        let s = NSMutableAttributedString(attributedString: self.value)
        
        let range = self.value.range
        
        let attributes = container.build()
        
        ranges.forEach { s.addAttributes(attributes, range: range.clamped(to: $0).toNSRange(in: self.value.string)) }
        
        return s
    }
}

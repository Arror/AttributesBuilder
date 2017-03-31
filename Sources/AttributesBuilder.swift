import UIKit

public final class AttributesBuilder {
    
    var attributes: [String: Any] = [:]
    
    public init() {}
}

extension AttributesBuilder {
    
    convenience init(attributes: [String: Any]) {
        self.init()
        self.attributes = attributes
    }
    
    subscript(key: String) -> Any? {
        set {
            self.attributes[key] = newValue
        }
        get {
            return self.attributes[key]
        }
    }
}

extension AttributesBuilder {
    
    public var copied: AttributesBuilder { return AttributesBuilder(attributes: self.attributes) }
}

extension AttributesBuilder {
    
    public func link(_ url: URL) -> Self {
        self[NSLinkAttributeName] = url
        return self
    }
    
    public func backgroundColor(_ color: UIColor) -> Self {
        self[NSBackgroundColorAttributeName] = color
        return self
    }
    
    public func characterSpacing(_ spacing: Int) -> Self {
        self[NSKernAttributeName] = spacing
        return self
    }
    
    public func font(_ font: UIFont) -> Self {
        self[NSFontAttributeName] = font
        return self
    }
    
    public func color(_ color: UIColor) -> Self {
        self[NSForegroundColorAttributeName] = color
        return self
    }
}

extension AttributesBuilder {
    
    private var paragraphStyle: NSMutableParagraphStyle {
        return self[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
    
    public func lineSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineSpacing = spacing
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    public func paragraphSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacing = spacing
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    public func alignment(_ mode: NSTextAlignment) -> Self {
        let style = self.paragraphStyle
        style.alignment = mode
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        let style = self.paragraphStyle
        style.lineBreakMode = mode
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let style = self.paragraphStyle
        style.baseWritingDirection = direction
        self[NSParagraphStyleAttributeName] = style
        return self
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
        
        let fullRange = self.value.string.fullRange
        
        ranges.forEach { range in
            s.addAttributes(builder.attributes, range: NSRange.from(countableRange: fullRange.clamped(to: range)))
        }
        
        return s
    }
}

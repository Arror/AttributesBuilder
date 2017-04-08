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

public enum LigatureStyle: Int {
    case none       = 0
    case `default`  = 1
}

public enum VerticalGlyphFormStyle: Int {
    case horizontal = 0
    case vertical   = 1
}

public enum TextEffect: String {
    
    case letterpress
    
    public var rawValue: String {
        switch self {
        case .letterpress:
            return NSTextEffectLetterpressStyle
        }
    }
}

extension AttributesBuilder {
    
    // NSFontAttributeName
    public func font(_ font: UIFont) -> Self {
        self[NSFontAttributeName] = font
        return self
    }
    
    // NSForegroundColorAttributeName
    public func color(_ color: UIColor) -> Self {
        self[NSForegroundColorAttributeName] = color
        return self
    }
    
    // NSBackgroundColorAttributeName
    public func backgroundColor(_ color: UIColor) -> Self {
        self[NSBackgroundColorAttributeName] = color
        return self
    }
    
    // NSLigatureAttributeName
    public func ligature(_ style: LigatureStyle) -> Self {
        self[NSLigatureAttributeName] = style.rawValue
        return self
    }
    
    // NSKernAttributeName
    public func characterSpacing(_ spacing: CGFloat) -> Self {
        self[NSKernAttributeName] = spacing
        return self
    }
    
    // NSStrikethroughStyleAttributeName
    public func strikethroughStyle(_ style: NSUnderlineStyle) -> Self {
        self[NSStrikethroughStyleAttributeName] = style.rawValue
        return self
    }
    
    // NSStrikethroughColorAttributeName
    public func strikethroughColor(_ color: UIColor) -> Self {
        self[NSStrikethroughColorAttributeName] = color
        return self
    }
    
    // NSUnderlineStyleAttributeName
    public func underlineStyle(_ style: NSUnderlineStyle) -> Self {
        self[NSUnderlineStyleAttributeName] = style.rawValue
        return self
    }
    
    // NSUnderlineColorAttributeName
    public func underlineColor(_ color: UIColor) -> Self {
        self[NSUnderlineColorAttributeName] = color
        return self
    }
    
    // NSStrokeWidthAttributeName
    public func strokeWidth(_ width: CGFloat) -> Self {
        self[NSStrokeWidthAttributeName] = width
        return self
    }
    
    // NSStrokeColorAttributeName
    public func strokeColor(_ color: UIColor) -> Self {
        self[NSStrokeColorAttributeName] = color
        return self
    }
    
    // NSShadowAttributeName
    public func shadow(_ value: NSShadow) -> Self {
        self[NSShadowAttributeName] = value
        return self
    }
    
    // NSTextEffectAttributeName
    public func textEffect(_ effect: TextEffect) -> Self {
        self[NSTextEffectAttributeName] = effect.rawValue
        return self
    }
    
    // NSAttachmentAttributeName
    public func attachment(_ value: NSTextAttachment) -> Self {
        self[NSAttachmentAttributeName] = value
        return self
    }
    
    // NSLinkAttributeName
    public func link(_ url: URL) -> Self {
        self[NSLinkAttributeName] = url
        return self
    }
    
    // NSBaselineOffsetAttributeName
    public func baselineOffset(_ offset: CGFloat) -> Self {
        self[NSBaselineOffsetAttributeName] = offset
        return self
    }
    
    // NSObliquenessAttributeName
    public func obliqueness(_ value: CGFloat) -> Self {
        self[NSObliquenessAttributeName] = value
        return self
    }
    
    // NSExpansionAttributeName
    public func expansion(_ value: CGFloat) -> Self {
        self[NSExpansionAttributeName] = value
        return self
    }
    
    // NSVerticalGlyphFormAttributeName
    public func verticalGlyphForm(_ style: VerticalGlyphFormStyle) -> Self {
        self[NSVerticalGlyphFormAttributeName] = style.rawValue
        return self
    }
}

extension AttributesBuilder {
    
    private var paragraphStyle: NSMutableParagraphStyle {
        return self[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
    
    // NSParagraphStyleAttributeName - alignment
    public func alignment(_ mode: NSTextAlignment) -> Self {
        let style = self.paragraphStyle
        style.alignment = mode
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - firstLineHeadIndent
    public func firstLineHeadIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.firstLineHeadIndent = indent
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - headIndent
    public func headIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.headIndent = indent
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - tailIndent
    public func tailIndent(_ indent: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.tailIndent = indent
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineBreakMode
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        let style = self.paragraphStyle
        style.lineBreakMode = mode
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - minimumLineHeight
    public func minimumLineHeight(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.minimumLineHeight = height
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - maximumLineHeight
    public func maximumLineHeight(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.maximumLineHeight = height
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineSpacing
    public func lineSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineSpacing = spacing
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - paragraphSpacing
    public func paragraphSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacing = spacing
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - paragraphSpacingBefore
    public func paragraphSpacingBefore(_ spacingBefore: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacingBefore = spacingBefore
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - baseWritingDirection
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let style = self.paragraphStyle
        style.baseWritingDirection = direction
        self[NSParagraphStyleAttributeName] = style
        return self
    }
    
    // NSParagraphStyleAttributeName - lineHeightMultiple
    public func lineHeightMultiple(_ height: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineHeightMultiple = height
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

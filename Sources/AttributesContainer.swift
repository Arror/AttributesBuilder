import Foundation

public protocol AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any] { get }
}

internal protocol _AttributesContainer: AttributesContainer {
    
    var attributes: [NSAttributedStringKey : Any] { get set }
    
    init()
    
    init(_ attributes: [NSAttributedStringKey: Any])
}

extension AttributesContainer {
    
    internal func build() -> [NSAttributedStringKey: Any] {
        
        var copied = self.attributes
        
        if let style = self.attributes[.paragraphStyle] as? NSParagraphStyle {
            
            style.mutableCopy()
            
            copied[.paragraphStyle] = style
        }
        
        return copied
    }
}

extension _AttributesContainer {
    
    public init(_ initialBlock: (inout Self) -> Void) {
        
        self.init()
        
        initialBlock(&self)
    }
    
    public func copy(_ copyBlock: (inout Self) -> Void) -> Self {
        
        var builder = type(of: self).init(self.build())
        
        copyBlock(&builder)
        
        return builder
    }
}

extension NSAttributedString {
    
    public enum LigatureStyle: Int {
        case none       = 0
        case `default`  = 1
    }
    
    public enum VerticalGlyphFormStyle: Int {
        case horizontal = 0
        case vertical   = 1
    }
}

extension _AttributesContainer {
    
    // NSFontAttributeName
    public mutating func font(_ font: @autoclosure () -> UIFont) {
        self.attributes[.font] = font()
    }
    
    // NSForegroundColorAttributeName
    public mutating func color(_ color: @autoclosure () -> UIColor) {
        self.attributes[.foregroundColor] = color()
    }
    
    // NSBackgroundColorAttributeName
    public mutating func backgroundColor(_ color: @autoclosure () -> UIColor) {
        self.attributes[.backgroundColor] = color()
    }
    
    // NSLigatureAttributeName
    public mutating func ligature(_ style: @autoclosure () -> NSAttributedString.LigatureStyle) {
        self.attributes[.ligature] = style().rawValue
    }
    
    // NSKernAttributeName
    public mutating func characterSpacing(_ spacing: @autoclosure () -> CGFloat) {
        self.attributes[.kern] = spacing()
    }
    
    // NSStrikethroughStyleAttributeName
    public mutating func strikethroughStyle(_ style: @autoclosure () -> NSUnderlineStyle) {
        self.attributes[.strikethroughStyle] = style()
    }
    
    // NSStrikethroughColorAttributeName
    public mutating func strikethroughColor(_ color: @autoclosure () -> UIColor) {
        self.attributes[.strikethroughColor] = color()
    }
    
    // NSUnderlineStyleAttributeName
    public mutating func underlineStyle(_ style: @autoclosure () -> NSUnderlineStyle) {
        self.attributes[.underlineStyle] = style()
    }
    
    // NSUnderlineColorAttributeName
    public mutating func underlineColor(_ color: @autoclosure () -> UIColor) {
        self.attributes[.underlineColor] = color()
    }
    
    // NSStrokeWidthAttributeName
    public mutating func strokeWidth(_ width: @autoclosure () -> CGFloat) {
        self.attributes[.strokeWidth] = width()
    }
    
    // NSStrokeColorAttributeName
    public mutating func strokeColor(_ color: @autoclosure () -> UIColor) {
        self.attributes[.strokeColor] = color()
    }
    
    // NSShadowAttributeName
    public mutating func shadow(_ value: @autoclosure () -> NSShadow) {
        self.attributes[.shadow] = value()
    }
    
    // NSTextEffectAttributeName
    public mutating func textEffect(_ effect: @autoclosure () -> NSAttributedString.TextEffectStyle) {
        self.attributes[.textEffect] = effect()
    }
    
    // NSAttachmentAttributeName
    public mutating func attachment(_ value: @autoclosure () -> NSTextAttachment) {
        self.attributes[.attachment] = value()
    }
    
    // NSLinkAttributeName
    public mutating func link(_ url: @autoclosure () -> URL) {
        self.attributes[.link] = url()
    }
    
    // NSBaselineOffsetAttributeName
    public mutating func baselineOffset(_ offset: @autoclosure () -> CGFloat) {
        self.attributes[.baselineOffset] = offset()
    }
    
    // NSObliquenessAttributeName
    public mutating func obliqueness(_ value: @autoclosure () -> CGFloat) {
        self.attributes[.obliqueness] = value()
    }
    
    // NSExpansionAttributeName
    public mutating func expansion(_ value: @autoclosure () -> CGFloat) {
        self.attributes[.expansion] = value()
    }
    
    // NSVerticalGlyphFormAttributeName
    public mutating func verticalGlyphForm(_ style: @autoclosure () -> NSAttributedString.VerticalGlyphFormStyle) {
        self.attributes[.verticalGlyphForm] = style().rawValue
    }
    
    // NSParagraphStyleAttributeName
    public mutating func paragraphStyle(_ style: @autoclosure () -> NSParagraphStyle) {
        self.attributes[.paragraphStyle] = style()
    }
}
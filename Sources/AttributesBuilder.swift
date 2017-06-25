import UIKit

public struct AttributesBuilder {
    
    var storage: [NSAttributedStringKey : Any]
    
    private init() {
        self.storage = [:]
    }
    
    private init(attributes: [NSAttributedStringKey : Any]) {
        self.storage = attributes
    }
    
    private subscript(_ key: NSAttributedStringKey) -> Any? {
        set {
            self.storage[key] = newValue
        }
        get {
            return self.storage[key]
        }
    }
    
    public init(_ initialBlock: (inout AttributesBuilder) -> Void) {
        
        self.init()
        
        initialBlock(&self)
    }
    
    public func copy(_ copyBlock: (inout AttributesBuilder) -> Void) -> AttributesBuilder {
        
        var builder = type(of: self).init(attributes: self.storage.copied)
        
        copyBlock(&builder)
        
        return builder
    }
    
    public mutating func font(_ font: @autoclosure () -> UIFont) {
        self[.font] = font()
    }
    
    public mutating func color(_ color: @autoclosure () -> UIColor) {
        self[.foregroundColor] = color()
    }
    
    public mutating func backgroundColor(_ color: @autoclosure () -> UIColor) {
        self[.backgroundColor] = color()
    }
    
    public mutating func ligature(_ style: @autoclosure () -> NSAttributedString.LigatureStyle) {
        self[.ligature] = style().rawValue
    }
    
    public mutating func characterSpacing(_ spacing: @autoclosure () -> CGFloat) {
        self[.kern] = spacing()
    }
    
    public mutating func strikethroughStyle(_ style: @autoclosure () -> NSUnderlineStyle) {
        self[.strikethroughStyle] = style()
    }
    
    public mutating func strikethroughColor(_ color: @autoclosure () -> UIColor) {
        self[.strikethroughColor] = color()
    }
    
    public mutating func underlineStyle(_ style: @autoclosure () -> NSUnderlineStyle) {
        self[.underlineStyle] = style()
    }
    
    public mutating func underlineColor(_ color: @autoclosure () -> UIColor) {
        self[.underlineColor] = color()
    }
    
    public mutating func strokeWidth(_ width: @autoclosure () -> CGFloat) {
        self[.strokeWidth] = width()
    }
    
    public mutating func strokeColor(_ color: @autoclosure () -> UIColor) {
        self[.strokeColor] = color()
    }
    
    public mutating func shadow(_ value: @autoclosure () -> NSShadow) {
        self[.shadow] = value()
    }
    
    public mutating func textEffect(_ effect: @autoclosure () -> NSAttributedString.TextEffectStyle) {
        self[.textEffect] = effect()
    }
    
    public mutating func attachment(_ value: @autoclosure () -> NSTextAttachment) {
        self[.attachment] = value()
    }
    
    public mutating func link(_ url: @autoclosure () -> URL) {
        self[.link] = url()
    }
    
    public mutating func baselineOffset(_ offset: @autoclosure () -> CGFloat) {
        self[.baselineOffset] = offset()
    }
    
    public mutating func obliqueness(_ value: @autoclosure () -> CGFloat) {
        self[.obliqueness] = value()
    }
    
    public mutating func expansion(_ value: @autoclosure () -> CGFloat) {
        self[.expansion] = value()
    }
    
    public mutating func verticalGlyphForm(_ style: @autoclosure () -> NSAttributedString.VerticalGlyphFormStyle) {
        self[.verticalGlyphForm] = style().rawValue
    }
    
    public mutating func paragraphStyle(_ modifyBlock: (NSMutableParagraphStyle) -> Void) {
        
        let origin = self.storage[.paragraphStyle] as? NSParagraphStyle ?? NSParagraphStyle.default
        
        let style = origin.mutableCopy() as! NSMutableParagraphStyle
        
        modifyBlock(style)
        
        self.storage[.paragraphStyle] = style.mutableCopy()
    }
}

extension Dictionary where Key == NSAttributedStringKey, Value == Any {
    
    var copied: Dictionary {
        
        var c = self
        
        if let style = self[.paragraphStyle] as? NSParagraphStyle {
            
            c[.paragraphStyle] = style.mutableCopy()
        }
        
        return c
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

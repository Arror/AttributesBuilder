import UIKit

protocol AttributesAdmissible: class {
    
    init()
    var attributes: [String: Any] { set get }
    func attribute(forKey key: String) -> Any?
    func set(attribute: Any, forKey key: String) -> Self
}

extension AttributesAdmissible {
    
    func attribute(forKey key: String) -> Any? {
        return self.attributes[key]
    }
    
    func set(attribute: Any, forKey key: String) -> Self {
        self.attributes[key] = attribute
        return self
    }
    
    init(attributes: [String: Any]) {
        self.init()
        self.attributes = attributes
    }
}

extension AttributesAdmissible {
    
    public var copied: Self { return type(of: self).init(attributes: self.attributes) }
}

extension AttributesAdmissible {
    
    public func link(_ url: URL) -> Self {
        return self.set(attribute: url, forKey: NSLinkAttributeName)
    }
    
    public func backgroundColor(_ color: UIColor) -> Self {
        return self.set(attribute: color, forKey: NSBackgroundColorAttributeName)
    }
    
    public func characterSpacing(_ spacing: Int) -> Self {
        return self.set(attribute: spacing, forKey: NSKernAttributeName)
    }
    
    public func font(_ font: UIFont) -> Self {
        return self.set(attribute: font, forKey: NSFontAttributeName)
    }
    
    public func color(_ color: UIColor) -> Self {
        return self.set(attribute: color, forKey: NSForegroundColorAttributeName)
    }
}

extension AttributesAdmissible {
    
    private var paragraphStyle: NSMutableParagraphStyle {
        return self.attribute(forKey: NSParagraphStyleAttributeName) as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
    }
    
    public func lineSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.lineSpacing = spacing
        return self.set(attribute: style, forKey: NSParagraphStyleAttributeName)
    }
    
    public func paragraphSpacing(_ spacing: CGFloat) -> Self {
        let style = self.paragraphStyle
        style.paragraphSpacing = spacing
        return self.set(attribute: style, forKey: NSParagraphStyleAttributeName)
    }
    
    public func alignment(_ mode: NSTextAlignment) -> Self {
        let style = self.paragraphStyle
        style.alignment = mode
        return self.set(attribute: style, forKey: NSParagraphStyleAttributeName)
    }
    
    public func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        let style = self.paragraphStyle
        style.lineBreakMode = mode
        return self.set(attribute: style, forKey: NSParagraphStyleAttributeName)
    }
    
    public func baseWritingDirection(_ direction: NSWritingDirection) -> Self {
        let style = self.paragraphStyle
        style.baseWritingDirection = direction
        return self.set(attribute: style, forKey: NSParagraphStyleAttributeName)
    }
}

import UIKit
import AttributesBuilder

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkStr = "https://github.com/Arror"
        
        let content = """
        CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects.
        
        ✨+✨+✨ Github: \(linkStr)
        """
        
        let whole = AttributesBuilder {
            
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 4.0
            
            $0.color(.gray)
            $0.font(.systemFont(ofSize: 14.0))
            $0.paragraphStyle(style)
        }
        
        let link = AttributesBuilder {
            $0.color(.blue)
            $0.link(URL(string: linkStr)!)
        }
        
        let first = whole.copy {
            $0.font(.systemFont(ofSize: 24.0))
        }
        
        let mark = AttributesBuilder {
            $0.font(.boldSystemFont(ofSize: 30.0))
        }
        
        let r = content.startIndex..<(content.index(after: content.startIndex))
        
        self.contentLabel.attributedText = content
            .rs.rendered(by: whole)
            .rs.rendered(by: first, range: r)
            .rs.rendered(by: link, regexPattern: linkStr)
            .rs.rendered(by: mark, regexPattern: "✨")
    }
}


//
//  ViewController.swift
//  HTMLLinkDetectorExample
//
//  Created by Kaan Ozdemir on 4.09.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textView.attributedText = "<a href=\"https://google.com//\">Visit Google</a> <a href=\"https://facebook.com//\">Visit Facebook</a> <a href=\"https://twitter.com//\">Visit Twitter</a>".convertHtml()
        
        
        textView.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        print(URL)
        return true
    }
}

extension String {
    
    func convertHtml() -> NSAttributedString{
        let htmlCSSString = "<style>" +
            "html *" +
            "{" +
            "font-size: 10pt !important;" +
            "font-family: Helvetica, Helvetica !important;" +
        "}</style>"
        
        guard var data = data(using: .utf8) else { return NSAttributedString() }
        do{
            
            
            data.append(Data(htmlCSSString.utf8))
            
            let attributedString = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            return attributedString
        }catch{
            return NSAttributedString()
        }
    }
}

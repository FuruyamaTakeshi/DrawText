//
//  ViewController.swift
//  DrawText
//
//  Created by Furuyama Takeshi on 2015/07/18.
//  Copyright (c) 2015年 Furuyama Takeshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let text = "0123456789a123456789b123456789c123456789d123456789e123456789f123456789g123456789h"
        let galolis = "ガロア理論（ガロア-りろん、Galois theory）は、代数方程式や体の構造を ガロア群と呼ばれる群を用いて記述する理論。1830年代のエヴァリスト・ガロアによる代数方程式の冪根による可解性などの研究が由来。"
        let image = self.imageWithString(galolis)
        let iimage = NSString.imageFromText(text, font: UIFont.systemFontOfSize(16), maxWidth: 160, color: UIColor.blackColor())
        self.imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imageWithString(string: NSString) -> UIImage {
        
        let font = UIFont.boldSystemFontOfSize(14)
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.Left
        style.lineBreakMode = NSLineBreakMode.ByCharWrapping
        
        let attributes = [NSFontAttributeName: font,
            NSParagraphStyleAttributeName: style]
        
        let stringSize = string.sizeWithAttributes(attributes)
        let size = CGSizeMake(320, 480)
    
        let lineCount = ceil(stringSize.width/(size.width))

        let offset = CGFloat(5)
        let size1 = string.boundingRectWithSize(CGSizeMake(size.width-offset, stringSize.height*lineCount), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil).size

        UIGraphicsBeginImageContext(size)
        println("size: \(size)")
        println("size1: \(size1)")
        println("stringSize:\(stringSize)")
        println("lineCount:\(lineCount)")
        
        string.drawInRect(CGRectMake(offset, 22, size1.width, size1.height), withAttributes: attributes)
        
        let renderedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return renderedImage
    }

}


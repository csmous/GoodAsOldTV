//
//  DetailProdViewController.swift
//  GoodAsOldPhones
//
//  Created by csmous on 28/11/2018.
//  Copyright © 2018 csmous. All rights reserved.
//

import UIKit
import os.log


class DetailProdViewController: UIViewController {


    var item : Product!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descrTextField: UITextView!
    @IBOutlet private weak var backgroundView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titleLabel.text = item.item.modelName
        descrTextField.text = item.fullModelDescription
        

        let rangeBold : NSRange = NSRange(location: 0, length: 1)
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.black,
                     NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 20)!,
                   /*  NSAttributedString.Key.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle as NSString*/]

        let string = NSMutableAttributedString(string: item.modelName)
        string.setAttributes(attrs, range: rangeBold)
        titleLabel.attributedText = string

        backgroundView.image = UIImage(named:item.fullscreenImage!)

    }



}

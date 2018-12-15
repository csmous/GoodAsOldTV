//
//  ContactUsViewController.swift
//  GoodAsOldPhones
//
//  Created by csmous on 29/11/2018.
//  Copyright © 2018 csmous. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    @IBOutlet weak var recyclePict: UIImageView!
    @IBOutlet weak var recycleTextView: UITextView!
    @IBOutlet weak var warantyPict: UIImageView!
    @IBOutlet weak var warrantyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exclusionWarrantyPath = UIBezierPath(rect: CGRect(x: (warantyPict.bounds.origin.x + warantyPict.bounds.size.width), y: warantyPict.bounds.origin.y, width: warantyPict.bounds.size.width, height: warantyPict.bounds.size.height))
        warrantyTextView.textContainer.exclusionPaths = [exclusionWarrantyPath]
        
        
        
        let convertedFrame  = recycleTextView.convert(recyclePict.frame, from: self.view)
        let exclusionRecyclePath = UIBezierPath(rect: convertedFrame);
        recycleTextView.textContainer.exclusionPaths = [exclusionRecyclePath]
        //recycleTextView.layoutManager.hyphenationFactor = 10.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

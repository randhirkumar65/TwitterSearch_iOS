//
//  Loader.swift
//  TweetItSweet
//
//  Created by Randhir Kumar on 17/06/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
import UIKit

class Loader: NSObject {
    
    // MARK:- Show Alert
    class func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            }))
            APP_DEL.window?.rootViewController!.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK:- Show Toast
    class func showToast(message: String, onView: UIView, bottomMargin: CGFloat) {
        onView.endEditing(true)
        DispatchQueue.main.async {
            APP_DEL.window?.viewWithTag(9999)?.removeFromSuperview()
            let toastLabel = UILabel(frame: CGRect(x: 20, y: ScreenSize.SCREEN_HEIGHT - bottomMargin, width: onView.frame.size.width - 40, height: 60))
            toastLabel.tag = 9999
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center;
            toastLabel.font = UIFont.systemFont(ofSize: 15)
            toastLabel.text = message
            
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.numberOfLines = 0
            toastLabel.clipsToBounds = true
            APP_DEL.window?.addSubview(toastLabel)
            perform(#selector(Loader.removeToast(label:)), with: toastLabel, afterDelay: 1.5)
        }
    }
    
    @objc class func removeToast(label:UILabel) -> Void {
        label.removeFromSuperview()
    }
    
}

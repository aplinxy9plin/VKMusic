//
//  AuthorizationController.swift
//  VKMusicNew
//
//  Created by Nikita Aplin on 07.03.18.
//  Copyright © 2017 TOP4EK. All rights reserved.
//

import UIKit

class AuthorizationController: UIViewController, UIWebViewDelegate {
    
    var webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView(frame: self.view.frame)
    }
    
    @IBAction func authButtonAction(_ sender: UIButton) {
        webView.delegate = self
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=4831307&scope=offline,audio&display=popup&redirect_uri=https://oauth.vk.com/blank.html&response_type=token")!
        
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
        self.view.addSubview(webView)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url!.absoluteString.replacingOccurrences(of: "#", with: "?")
        
        print(url)
        
        let queryItems = URLComponents(string: url)?.queryItems
        let token = queryItems?.filter({$0.name == "access_token"}).first
        let user_id = queryItems?.filter({$0.name == "user_id"}).first
        print("\(token?.value) | \(user_id?.value)")
        
        if (token?.value != nil && user_id?.value != nil) {
            Global.token = token!.value!
            Global.user_id = Int(user_id!.value!)
            
            Global.appDelegate.loadDrawerController(parentViewController: self)
        }
        
        return true
    }
    
}

//
//  ViewController.swift
//  WebView
//
//  Created by John marru Llurag on 26/06/2017.
//  Copyright © 2017 John marru Llurag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaultURL = "https://github.com/jmnllurag"
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var bookmarkButton: UIBarButtonItem!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        webView.delegate = self
        goTo(defaultURL)
        
    }

    func goTo(_ url: String) {
        let urlPassed = URL(string: url)
        let urlRequestObject = URLRequest(url: urlPassed!)
        webView.loadRequest(urlRequestObject as URLRequest)
    }
    
    
    @IBAction func pressBackButton(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func pressForwardButton(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func pressRefreshButton(_ sender: UIBarButtonItem) {
        webView.reload()
    }
   
    @IBAction func pressHomeButton(_ sender: UIBarButtonItem) {
        goTo(defaultURL)
    }
    
    
}

// MARK: extends the webview delegate to control the webview
extension ViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        activityIndicatorView.startAnimating()
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
       
        activityIndicatorView.stopAnimating()
        checkMenu()
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //add func here
        return true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        //add func here
    }

    func checkMenu(){
        
        if webView.canGoBack {
            backButton.isEnabled = true
        } else {
            backButton.isEnabled = false
        }
        
        if webView.canGoForward {
            forwardButton.isEnabled = true
        } else {
            forwardButton.isEnabled = false
        }
        
    }
}

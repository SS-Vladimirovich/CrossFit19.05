//
//  WKWebViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 16.05.2022.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view = webView
        webView.navigationDelegate = self
        if let request = NetworkingService().getAuthorizeRequest() {
            webView.load(request)
        }
    }
}
extension WKWebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }

        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce ([String:String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict

        }

        let token = params["access_token"]
        let userID = params["user_id"]
        Session.instance.userId = Int(userID ?? "")!
        Session.instance.token = token!

        performSegue(
            withIdentifier: "loginViewIndenti",
            sender: nil)
        decisionHandler(.cancel)
    }
}

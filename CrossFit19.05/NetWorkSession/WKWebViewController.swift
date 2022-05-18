//
//  WKWebViewController.swift
//  CrossFit19.05
//
//  Created by Sergey Sokolov on 16.05.2022.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self

        var urlComponents = URLComponents(string: "https://oauth.vk.com/authorize")
        urlComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: "8168219"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]

        guard let url = urlComponents?.url else { return }
        let request = URLRequest(url: url)

        webView.load(request)
    }
}

extension WKWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        decisionHandler(.allow)

        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else { return }

        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String : String](), { partialResult, param in
                var dict = partialResult
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            })

        guard
            let token = params["access_token"],
            let userId = Int(params["user_id"] ?? "")
        else { return }

        Session.instance.token = token
        Session.instance.userId = userId

        decisionHandler(.cancel)
    }
}

class NetworkService {

    private init() {}

    static let shared = NetworkService()

    func sendGetRequest(url: URL, completion: @escaping(Any?) -> ()) {

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }

            let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)

        }.resume()
    }
}


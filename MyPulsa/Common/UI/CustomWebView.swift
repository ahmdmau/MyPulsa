//
//  CustomWebView.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import UIKit
import WebKit

class CustomWebView: UIView {
    
    // MARK: - Properties
    private var webView: WKWebView?
    var activityIndicator: UIActivityIndicatorView!
    private var intrinsicContentHeight: CGFloat? {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public var isScrollEnabled: Bool = true {
        didSet {
            webView?.scrollView.isScrollEnabled = isScrollEnabled
        }
    }
    
    static var webViewHtml: URL = {
        return Bundle.main.url(forResource: "webview", withExtension: "html")!
    }()
    
    public var onTouchLink: ((URLRequest) -> Bool)?
    public var onRendered: ((CGFloat) -> Void)?
    private let emptyMarkdown = "<p>-</p>"
    
    // MARK: - Lifecycle
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public convenience init(markdown: String?) {
        self.init(frame: .zero)
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = makeContentController(markdown: markdown)
        webView = makeWebView(with: configuration)
        self.webView?.load(URLRequest(url: Self.webViewHtml))
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override var intrinsicContentSize: CGSize {
        if let height = self.intrinsicContentHeight {
            return CGSize(width: UIView.noIntrinsicMetric, height: height)
        } else {
            return CGSize.zero
        }
    }
    
    public func load(_ markdown: String) {
        self.webView?.removeFromSuperview()
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = makeContentController(markdown: markdown.isEmpty ? emptyMarkdown : markdown)
        webView = makeWebView(with: configuration)
        self.webView?.load(URLRequest(url: Self.webViewHtml))
    }
    
}

// MARK: - Methods
extension CustomWebView {
    
    private func makeWebView(with configuration: WKWebViewConfiguration) -> WKWebView {
        let wv = WKWebView(frame: self.bounds, configuration: configuration)
        wv.scrollView.isScrollEnabled = false
        wv.navigationDelegate = self
        wv.translatesAutoresizingMaskIntoConstraints = false
        addSubview(wv)
        wv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        wv.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        wv.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        wv.isOpaque = false
        wv.backgroundColor = .clear
        wv.scrollView.backgroundColor = .clear
        return wv
    }
    
    private func makeContentController(markdown: String?) -> WKUserContentController {
        let controller = WKUserContentController()
        
        if let markdown = markdown {
            let escapedMarkdown = self.escape(markdown: markdown) ?? ""
            let imageOption = "true"
            let script = "window.showMarkdown('\(escapedMarkdown)', \(imageOption));"
            let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            controller.addUserScript(userScript)
        }
        
        return controller
    }
    
    private func styleScript(_ css: String) -> String {
        [
            "var s = document.createElement('style');",
            "s.innerHTML = `\(css)`;",
            "document.head.appendChild(s);"
        ].joined()
    }
    
    private func escape(markdown: String) -> String? {
        return markdown.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
    }
    
    private var evaluateHeightScript: String {
        [
            "var _body = document.body;",
            "var _html = document.documentElement;",
            "Math.max(_body.scrollHeight, _body.offsetHeight, _html.clientHeight, _html.scrollHeight, _html.offsetHeight);"
        ].joined()
    }
    
    private func evaluateHeight(in webView: WKWebView) {
        webView.evaluateJavaScript(evaluateHeightScript) { [weak self] result, error in
            if error != nil { return }
            if let height = result as? CGFloat {
                DispatchQueue.main.async {
                    self?.onRendered?(height)
                    self?.intrinsicContentHeight = height
                    self?.setNeedsLayout()
                    self?.layoutIfNeeded()
                }
            }
        }
    }
}

extension CustomWebView: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        evaluateHeight(in: webView)
    }
    
}

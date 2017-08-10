//
//  YYHRequest
//  YYHRequest
//
//  Created by Angelo Di Paolo on 6/3/14.
//  Copyright (c) 2014 Yayuhh. All rights reserved.
//

import Foundation

var _requestOperationQueue: OperationQueue?

class YYHRequest: NSObject, NSURLConnectionDataDelegate {
    typealias YYHRequestCompletionHandler = (URLResponse?, Data?, NSError?) -> Void
    
    var url: URL
    var method = "GET"
    var body = Data()
    var headers: Dictionary<String, String> = Dictionary()
    var parameters: Dictionary<String, String> = Dictionary()
    var connection: NSURLConnection?
    var response: URLResponse?
    lazy var responseData = NSMutableData()
    var completionHandler: YYHRequestCompletionHandler

    var contentType: String? {
    set {
        headers["Content-Type"] = newValue
    }
    get {
        return headers["Content-Type"]
    }
    }
    
    var userAgent: String? {
    set {
        headers["User-Agent"] = newValue
    }
    get {
        return headers["User-Agent"]
    }
    }
    
    init(url: URL) {
        self.url = url
        completionHandler = {response, data, error in}
        super.init()
    }
    
    // Request Loading
    
    func loadWithCompletion(_ completionHandler: @escaping YYHRequestCompletionHandler) {
        self.completionHandler = completionHandler
        loadRequest()
    }
    
    func loadRequest() {
        if (parameters.count > 0) {
            serializeRequestParameters()
        }
        
        if _requestOperationQueue == nil {
            _requestOperationQueue = OperationQueue()
            _requestOperationQueue!.maxConcurrentOperationCount = 4
            _requestOperationQueue!.name = "com.yayuhh.YYHRequest"
        }

        connection = NSURLConnection(request: urlRequest() as URLRequest, delegate: self)
        connection!.setDelegateQueue(_requestOperationQueue)
        connection!.start()
    }
    
    // Request Creation
    
    func urlRequest() -> NSMutableURLRequest {
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:29.0) Gecko/20100101 Firefox/29.0",forHTTPHeaderField:"User-Agent")

        
        for (field, value) in headers {
            request.setValue(value, forHTTPHeaderField: field)
        }
        
        if (body.count > 0) {
            request.setValue(String(body.count), forHTTPHeaderField: "Content-Length")
        }
        
        return request
    }
    
    // Request Parameters
    
    func serializeRequestParameters() {
        contentType = "application/x-www-form-urlencoded"
        
        if (method == "GET") {
            url = queryParametersURL()
        } else {
            body = serializedRequestBody()
        }
    }
    
    func serializedRequestBody() -> Data {
        return queryString().data(using: String.Encoding.utf8, allowLossyConversion: true)!
    }
    
    func queryParametersURL() -> URL {
        return URL(string: url.absoluteString + queryString())!
    }
    
    func queryString() -> String {
        var result = "?"
        var firstPass = true
        
        for (key, value) in parameters {
            let encodedKey: NSString = key.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn:"`#%^{}\"[]|\\<> ").inverted)! as NSString
            let encodedValue: NSString = value.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)! as NSString
            result += firstPass ? "\(encodedKey)=\(encodedValue)" : "&\(encodedKey)=\(encodedValue)"
            firstPass = false;
        }
        
        return result
    }
    
    // NSURLConnectionDataDelegate
    
    func connection(_: NSURLConnection!, error: NSError!) {
        completionHandler(nil, nil, error)
    }
    
    func connection(_: NSURLConnection, didReceive response: URLResponse) {
        self.response = response
    }
    
    func connection(_: NSURLConnection, didReceive data: Data) {
        responseData.append(data)
    }
    
    func connectionDidFinishLoading(_: NSURLConnection) {
        completionHandler(response, responseData as Data, nil)
    }
}

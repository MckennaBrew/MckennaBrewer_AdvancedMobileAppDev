//
//  TranslationDataHandler.swift
//  ShakespeareTranslator
//
//  Created by Mckenna Brewer on 3/7/21.
//

import Foundation

class TranslationDataHandler {
    var translationData : String = ""
    
    var onDataUpdate: ((_ data: String) -> Void)?
    
    func loadjson(text: String){
        // based off of api documentation
        //https://rapidapi.com/orthosie/api/shakespeare1?endpoint=apiendpoint_c52da285-97b1-4772-aaca-4319ed547911
        
        let headers = [
            "x-rapidapi-key": "d58b1ba500msh12679ddcd210dd1p16e2fdjsn1f59f86302cf",
            "x-rapidapi-host": "shakespeare1.p.rapidapi.com"
        ]
        
        
        let urlPath = "https://shakespeare1.p.rapidapi.com/shakespeare/translate?text=\(text)"
        
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
            }
        
        //NSLog(urlPath)
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print(statusCode)
            guard statusCode == 200
                else {
                    print("file download error")
                    return
                }
            //download successful
            print("download complete")
            //parse json asynchronously
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
        
    }
    
    func parsejson(_ data: Data){
        do
        {
            let apiData = try JSONDecoder().decode(TranslationData.self, from: data)
            
            //for translation in apiData.contents
            //{
            translationData = apiData.contents.translated
                //print(translation)
            //}
            print(apiData)
        }
        catch let jsonErr
        {
            print("json error")
            print(jsonErr.localizedDescription)
            return
        }
        print("parsejson done")
        //passing the results to the onDataUpdate closure
        onDataUpdate?(translationData)
    }
    
    
    func getTranslation() -> String {
       return translationData
    }
    
}

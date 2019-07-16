import Foundation
import SwiftSoup

public class GloomhavenMonsterImagesScrap {
  
  enum ScrapError: Error {
    case invalidUrl(String)
  }
  
  public init() { }
  
  public func start() throws {
    let url = URL(string: "http://www.cephalofair.com/gloomhaven-monster-spoilers")!
    let html = try String(contentsOf: url)
    let doc = try SwiftSoup.parse(html)
    
    for item in try doc.select(".entry-content p a") {
      let href = try item.attr("href")
      guard let url = URL(string: href) else {
        throw ScrapError.invalidUrl(href)
      }
      
      let fileName = url.lastPathComponent
      print("Downloading: \(fileName)")
      let data = try Data(contentsOf: url)
      
      let documentDirectory = try FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
      let fileURL = documentDirectory.appendingPathComponent(fileName)
      print("Save to: \(fileURL)")
      try data.write(to: fileURL)
    }
  }
}

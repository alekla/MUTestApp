import Foundation

struct Message: Codable, Equatable {
  let date: String
  let body: String
  let from: Image
  
  var dateValue: Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return formatter.date(from: date)
  }
  
  var dateFormattedString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.locale = Locale.current
    guard var date = dateValue else {
      return ""
    }
    let offfset: Double = 60 * 60 * 24 * 5
    date.addTimeInterval(3600 * 24 * 28 * 6 - offfset)
    let elapsedTimeInSeconds = Date().timeIntervalSince(date)
    
    let secondInDays: TimeInterval = 60 * 60 * 24
    
    if elapsedTimeInSeconds > 7 * secondInDays {
      dateFormatter.dateFormat = "dd.MM.yy"
    } else if elapsedTimeInSeconds > secondInDays {
      dateFormatter.dateFormat = "EEEE"
    }
    
    return dateFormatter.string(from: date)
  }
}

import Foundation

public class Logger {
    static var dateFormat = "yyyy-MM-dd hh:mm:ss"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }

    public class func log(error: String,
                     filename: String = #file,
                     line: Int = #line,
                     funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().convertToString()) \(LogEvent.error.rawValue) [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(error)")
        }
    }

    public class func log(message: String,
                     filename: String = #file,
                     line: Int = #line,
                     funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().convertToString()) \(LogEvent.message.rawValue) [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(message)")
        }
    }

    public class func log(warning: String,
                     filename: String = #file,
                     line: Int = #line,
                     funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().convertToString()) \(LogEvent.warning.rawValue) [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(warning)")
        }
    }

    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    enum LogEvent: String {
        case error = "[‼️]" // error
        case message = "[💬]" // debug
        case warning = "[⚠️]" // warning
    }
}

public func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}

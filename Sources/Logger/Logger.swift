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

    public class func log(_ message: String,
                     filename: String = #file,
                     line: Int = #line,
                     funcName: String = #function) {
        if isLoggingEnabled {
            print("\(Date().convertToString()) [\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(message)")
        }
    }

    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}

public func print(_ object: Any) {
    #if DEBUG
    Swift.print(object)
    #endif
}

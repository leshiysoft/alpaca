#ifndef ALPACA_LOGGER_H
#define ALPACA_LOGGER_H

#include <iostream>
#include <fstream>

#ifdef ALPACA_LOG_ON
#define ALPACA_LOG(text) Alpaca::Log::Logger::instance().write(std::string("//") + text + "");
#define ALPACA_LOG_FUNC(fname) Alpaca::Log::Logger::instance().write(#fname "(...)"); Alpaca::Log::LogBlock al_log_block(#fname);
#define ALPACA_LOG_BLOCK(bname) Alpaca::Log::Logger::instance().write(#bname ":"); Alpaca::Log::LogBlock al_log_block(#bname);
#define ALPACA_LOG_DUMP(var) Alpaca::Log::Logger::instance().write(#var " = "); Alpaca::Log::dump(var);
#else
#define ALPACA_LOG(text)
#define ALPACA_LOG_FUNC(fname)
#define ALPACA_LOG_BLOCK(bname)
#define ALPACA_LOG_DUMP(var)
#endif

#ifdef ALPACA_LOG_ON

namespace Alpaca {
namespace Log {

class Logger
{
    std::ofstream file;

    int depth = 0;

public:
    static Logger& instance(){
        static Logger logger;
        return logger;
    }

private:
    Logger(){
      file.open("log.c");
        bool ok = file.is_open();
        if (!ok){
            throw "log file is not opened";
        }
    }

public:
    void write(const std::string &text){
        for(int i=0; i<depth; i++){
            file << "  ";
        }
        file << text;
        file << "\n";
    }
    void depthIn(){ depth ++; }
    void depthOut(){
        depth--;
        if (depth<0)
            depth = 0;
    }
};

class LogBlock
{
public:
    LogBlock(std::string bn = "")
    {
        Logger::instance().write("{");
        Logger::instance().depthIn();
        blockName = bn;
    }
    ~LogBlock()
    {
        Logger::instance().depthOut();
        Logger::instance().write("} //" + blockName);
    }
    std::string blockName;
};

inline void dump(int i)
{
    Logger::instance().write(std::to_string(i));
}

inline void dump(std::string &s)
{
    Logger::instance().write("\"" + s + "\"");
}

} //namespace Log
} // namespace Alpaca

#endif // ALPACA_LOG_ON

#endif // ALPACA_LOGGER_H

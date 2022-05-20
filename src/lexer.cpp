#include "lexer.hpp"
#include "logger.hpp"

namespace Alpaca {

Lexer::Lexer()
{
  ALPACA_LOG_FUNC("Lexer::Lexer");
  patterns.reserve(100);
  patterns.push_back(Pattern{std::regex("^func"), std::string("func")});
  patterns.push_back(Pattern{std::regex("^for"), std::string("for")});

  patterns.push_back(Pattern{std::regex("^\\s+"), std::string("space")});
  patterns.push_back(Pattern{std::regex("^\\d+"), std::string("int")});
  patterns.push_back(Pattern{std::regex("^\\d+\\.\\d+"), std::string("float")});
  patterns.push_back(Pattern{std::regex("^[a-zA-Z][a-zA-Z0-9_]*"), std::string("id")});
  patterns.push_back(Pattern{std::regex("^\"(([^\"\\\\])|(\\\\.))*\""), std::string("string")});
  //patterns.push_back(Pattern{std::regex("^#[^\\n]*[\\n]?"), std::string("comment")});
  patterns.push_back(Pattern{std::regex("^#.*$"), std::string("comment")});

  std::vector<std::string> literals = {
      std::string( "]"  ),
      std::string( "{"  ),
      std::string( "}"  ),
      std::string( "("  ),
      std::string( ")"  ),
      std::string( "->" ),
      std::string( "<"  ),
      std::string( ">"  ),
      std::string( "<=" ),
      std::string( ">=" ),
      std::string( "==" ),
      std::string( "!=" ),
      std::string( "="  ),
      std::string( ","  ),
      std::string( ";"  ),
      std::string( ":"  ),
      std::string( "*"  ),
      std::string( "+"  ),
      std::string( "-"  ),
      std::string( "/"  ),
      std::string( "!"  ),
      std::string( "&"  ),
      std::string( "."  ),
      std::string( "||" ),
      std::string( "|"  ),
      std::string( "&&" ),
      std::string( "^^" ),
      std::string( "^"  ),
  };

  for (const auto& lit : literals)
  {
    std::string r("^");
    for(unsigned int i = 0; i < lit.size(); i++)
    {
      r += std::string("\\");
      r.push_back(lit[i]);
    }

    patterns.push_back(Pattern{std::regex(r), lit});
  }
} // Lexer::Lexer()



bool Lexer::getLexeme(std::string &text, std::string& typeName, std::string& res)
{
  ALPACA_LOG_FUNC("Lexer::getLexeme");
  std::smatch m;
  for (auto pat = patterns.begin(); pat != patterns.end(); pat++)
  {
    if ( std::regex_search(text, m, pat->regExp) )
    {
      res = m.str();
      typeName = pat->typeName;
      return true;
    }
  }
  return false;
} // Lexer::getLexem(...)



} // namespace Alpaca

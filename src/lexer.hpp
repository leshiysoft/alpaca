#ifndef ALPACA_LEXER_HPP
#define ALPACA_LEXER_HPP

#include <string>
#include <regex>
#include <vector>

namespace Alpaca {

class Lexer
{
public:
  Lexer();

  bool getLexeme(std::string &text, std::string& typeName, std::string &res);

  struct Pattern{
    std::regex regExp;
    std::string typeName;
  };
private:
  std::vector<Pattern> patterns;
}; // class Lexer

} // namespace Alpaca


#endif // ALPACA_LEXER_HPP

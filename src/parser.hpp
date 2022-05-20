#ifndef ALPACA_PARSER_HPP
#define ALPACA_PARSER_HPP

#include <string>
#include <list>
#include <vector>
#include <map>
#include <set>

namespace Alpaca {

class Parser
{
public:
  Parser();

  struct Symbol {
    bool isTerminal;
    std::string name;
  };

  struct Rule {
    Symbol leftSide;
    std::list<Symbol> rightSide;
  };

  struct Grammar {
    std::vector<Rule> rules;
  };

  struct {
    std::map<Symbol,std::set<Symbol>> firsts;
  } setOfFirsts;

  struct {
    std::map<Symbol,std::set<Symbol>> follows;
  } setOfFollows;

private:

}; // class Parser

} // namespace Alpaca

bool comp(Alpaca::Parser::Symbol a, Alpaca::Parser::Symbol b);
bool equiv(Alpaca::Parser::Symbol a, Alpaca::Parser::Symbol b);

#endif // ALPACA_PARSER_HPP

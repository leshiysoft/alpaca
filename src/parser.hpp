#ifndef ALPACA_PARSER_HPP
#define ALPACA_PARSER_HPP

#include <string>
#include <list>
#include <vector>
#include <map>
#include <set>

#include "logger.hpp"

namespace Alpaca {

class Parser
{
public:
  Parser();

  struct Symbol {
    bool isTerminal;
    std::string name;

    bool operator < (const Symbol &other) const
    {
      if (isTerminal == other.isTerminal)
      {
        return name < other.name;
      }
      return isTerminal < other.isTerminal;
    }
  };

  struct Rule {
    Symbol leftSide;
    std::list<Symbol> rightSide;
  };

  std::vector<Rule> rules;
  std::map<Symbol,std::set<Symbol>> firsts;
  std::map<Symbol,std::set<Symbol>> follows;

private:

  void addRule(const Rule &rule);
  void fillSetOfFirsts();
  void getNonTerminals(std::set<Symbol> &nonTerminals);

}; // class Parser

namespace Log
{
  inline void dump(std::vector<Parser::Rule> &rules)
  {
      Logger::instance().write("{");
      Logger::instance().depthIn();
      for(auto r = rules.begin(); r != rules.end(); r++)
      {
          std::string rule_str = r->leftSide.name;
          rule_str.append(" -> ");
          for(auto l = r->rightSide.begin(); l != r->rightSide.end(); l++)
          {
            rule_str.append(l->name + " ");
          }
          Logger::instance().write(rule_str);
      }
      Logger::instance().depthOut();
      Logger::instance().write("};");

  }
} // namespace Log

} // namespace Alpaca

#endif // ALPACA_PARSER_HPP

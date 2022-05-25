#ifndef ALPACA_PARSER_H
#define ALPACA_PARSER_H

#include <string>
#include <list>
#include <vector>
#include <map>
#include <set>

#include "logger.h"

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
    std::vector<Symbol> rightSide;
  };

  struct RuleState {
    Symbol leftSide;
    std::list<Symbol> before;
    std::list<Symbol> after;
    std::set<Symbol> follows;
  };

  struct Item {
    std::set<RuleState> states;
    std::map<Symbol, int> ways;
  };

  std::vector<Rule> rules;
  std::map<Symbol,std::set<Symbol>> firsts;
  std::map<Symbol,std::set<Symbol>> follows;

  std::vector<Item> items;
  std::map<std::set<RuleState>, int> items_index;

private:

  void addRule(const Rule &rule);
  void fillFirsts();
  void fillFollows();
  void generateGraph();

}; // class Parser

namespace Log
{
  inline void dump(const std::vector<Parser::Rule> &rules)
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

  inline void dump(const std::map<Parser::Symbol,std::set<Parser::Symbol>> &sets)
  {
    Logger::instance().write("{");
    Logger::instance().depthIn();
    for(auto kv = sets.begin(); kv != sets.end(); kv++)
    {
      std::string kv_str = kv->first.name;
      kv_str.append(" : ");
      for(auto sym = kv->second.begin(); sym != kv->second.end(); sym++)
      {
        kv_str.append(sym->name);
        kv_str.append(" ");
      }
      Logger::instance().write(kv_str);
    }
    Logger::instance().depthOut();
    Logger::instance().write("};");
  }
} // namespace Log

} // namespace Alpaca

#endif // ALPACA_PARSER_H

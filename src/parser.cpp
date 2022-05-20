#include "parser.hpp"
#include "logger.hpp"

namespace Alpaca
{

#define NTS(s) Symbol{false, #s}
#define TS(s) Symbol{true, #s}

  Parser::Parser()
  {
    ALPACA_LOG_FUNC(Parser::Parser);

    addRule(Rule{NTS(G),      {NTS(Prog)}});
    addRule(Rule{NTS(Prog),   {NTS(Clause)}});
    addRule(Rule{NTS(Prog),   {NTS(Prog),NTS(Clause)}});
    addRule(Rule{NTS(Clause), {TS(a),TS(b)}});
    addRule(Rule{NTS(Clause), {NTS(A)}});
    addRule(Rule{NTS(A),      {TS(c)}});

    ALPACA_LOG_DUMP(rules);
  }

  void Parser::addRule(const Rule &rule)
  {
    rules.push_back(rule);
  }

  void Parser::fillSetOfFirsts()
  {
    ALPACA_LOG_FUNC(Parser::fillSetOfFirsts);

    bool isSetOfFirstsChanged = true;
    while (isSetOfFirstsChanged)
    {
      isSetOfFirstsChanged = false;
      for(auto r = rules.begin(); r != rules.end(); r++)
      {
        std::set<Symbol> &firstsForTheRule = firsts[r->leftSide];
        Symbol &s = r->rightSide.front();
        if (s.isTerminal)
        {
          if (firstsForTheRule.find(s) == firstsForTheRule.end())
          {
            isSetOfFirstsChanged = true;
            firstsForTheRule.insert(s);
          }
        } else
        {
          std::set<Symbol> &otherFirsts = firsts[s];
          unsigned int size = firstsForTheRule.size();
          firstsForTheRule.insert(otherFirsts.begin(), otherFirsts.end());
          if (firstsForTheRule.size() > size)
          {
            isSetOfFirstsChanged = true;
          }
        }
      }
    }
  }

  void Parser::getNonTerminals(std::set<Symbol> &nonTerminals)
  {
    for(auto r = rules.begin(); r != rules.end(); r++)
    {
      nonTerminals.insert(r->leftSide);
    }
  }

} // namespace Alpaca

#include "parser.h"
#include "logger.h"

namespace Alpaca
{

#define NTS(s) Symbol{false, #s}
#define TS(s) Symbol{true, #s}

  Parser::Parser()
  {
    ALPACA_LOG_FUNC(Parser::Parser);

    addRule(Rule{NTS(G),      {NTS(Prog)}});
    addRule(Rule{NTS(Prog),   {NTS(Clause)}});
    addRule(Rule{NTS(Prog),   {NTS(Prog),NTS(Clause),TS(d)}});
    addRule(Rule{NTS(Clause), {TS(a),TS(b)}});
    addRule(Rule{NTS(Clause), {NTS(A)}});
    addRule(Rule{NTS(A),      {TS(c)}});

    ALPACA_LOG_DUMP(rules);

    fillFirsts();
    fillFollows();
  }

  void Parser::addRule(const Rule &rule)
  {
    rules.push_back(rule);
  }

  void Parser::fillFirsts()
  {
    ALPACA_LOG_FUNC(Parser::fillFirsts);

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
      ALPACA_LOG_DUMP(firsts);
    }
  }

  void Parser::fillFollows()
  {
    ALPACA_LOG_FUNC(Parser::fillFollows);

    Symbol endFile = {true, "$"};
    follows[rules[0].leftSide].insert(endFile);

    bool isSetOfFollowsChanged = true;
    while (isSetOfFollowsChanged)
    {
      isSetOfFollowsChanged = false;
      for (auto rule = rules.begin(); rule != rules.end(); rule++)
      {
        const std::vector<Symbol> &rightSide = rule->rightSide;
        for(int i=0; i<=(int)rightSide.size()-2; i++)
        {
          Symbol first = rightSide[i];
          Symbol second = rightSide[i+1];
          if (first.isTerminal)
          {
            continue;
          }
          if (second.isTerminal)
          {
            if (follows[first].find(second) == follows[first].end())
            {
              isSetOfFollowsChanged = true;
              follows[first].insert(second);
            }
          } else
          {
              unsigned int size = follows[first].size();
              follows[first].insert(firsts[second].begin(), firsts[second].end());
              if (follows[first].size() > size)
              {
                isSetOfFollowsChanged = true;
              }
          }
        }
        Symbol last = rightSide.back();
        if (!last.isTerminal)
        {
          unsigned int size = follows[last].size();
          follows[last].insert(follows[rule->leftSide].begin(),follows[rule->leftSide].end());
          if (follows[last].size() > size)
          {
            isSetOfFollowsChanged = true;
          }
        }
      }
      ALPACA_LOG_DUMP(follows);
    }
  }

  void Parser::generateGraph()
  {
    // TODO: реализовать
  }

} // namespace Alpaca

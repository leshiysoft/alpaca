#include "parser.hpp"

namespace Alpaca
{

  Parser::Parser()
  {

  }

} // namespace Alpaca

bool comp(Alpaca::Parser::Symbol a, Alpaca::Parser::Symbol b)
{
  if (a.isTerminal == b.isTerminal)
  {
    return a.name < b.name;
  }
  return a.isTerminal < b.isTerminal;
}

bool equiv(Alpaca::Parser::Symbol a, Alpaca::Parser::Symbol b)
{
  return a.isTerminal == b.isTerminal && a.name == b.name;
}

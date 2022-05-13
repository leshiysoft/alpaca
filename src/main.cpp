#include <stdio.h>
#include <iostream>

#include "lexer.hpp"

int main(int argc, char** argv)
{
  printf("Hello, alpaca!\n");

  std::string s ("for 456 == \n func `` hello");
  std::smatch m;

  Alpaca::Lexer lexer;

  std::string tn;

  std::string res;


  while (lexer.getLexeme(s, tn, res ))
  {
    std::cout << "[" << res << "] "<< tn << std::endl;
    s = s.substr(res.length());
  }

  if (s.length() > 0)
  {
    std::cout << "[" << s.substr(0, 10) << "] unknown" << std::endl;
  }

  return 0;
}

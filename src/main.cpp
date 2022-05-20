#include <stdio.h>
#include <iostream>

#include "lexer.hpp"
#include "logger.hpp"

int main(int argc, char** argv)
{
  ALPACA_LOG_FUNC("main");
  printf("Hello, alpaca!\n");

  std::string s;

  std::ifstream sourcefile;
  sourcefile.open ("al/test.al");


  std::smatch m;

  Alpaca::Lexer lexer;

  std::string tn;

  std::string res;

  int line = 0;
  int pos;

  while (!sourcefile.eof())
  {
    std::getline(sourcefile, s);
    line++;
    pos = 0;



    while (s.length() > 0 && lexer.getLexeme(s, tn, res ))
    {
      std::cout << line << ":" << pos << "\t[" << res << "] "<< tn << std::endl;
      s = s.substr(res.length());
      pos += res.length();
    }

    if (s.length() > 0)
    {
      std::cout << "[" << s.substr(0, 10) << "] unknown" << std::endl;
    }

  }
  sourcefile.close();

  return 0;
}

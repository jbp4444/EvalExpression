EvalExpression
==============

Lua/Corona code to evaluate mathematical expressions

(should not rely on anything specific to the Corona SDK, but I haven't double-checked)

-----

This module can be used to parse simple math strings to produce numeric results:

```
  local text = "1+2*3"
  local result = evalString( text, nil )
  print( "result = "..result )
  -- should print 7
```

The particular use-case is in mobile apps where app-store regulations prohibit Lua's
native "eval" function (since it could be used to execute arbitrary/bad code).  This
library does simple string manipulations and string-to-number conversions (which are
allowed).

* You can pass it a table of substitutions (key-value pairs) and those variables will
be inserted before evaluating the math

* It understands a half-dozen or so mathematical functions, but should be easily
extendible if you need others (look for the "fcn_table" table)


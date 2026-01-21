Ruby’s Enumerable module provides iterator methods like find, map, select, etc.

You can rebuild these methods yourself by reopening the Enumerable module and using:

each to iterate

yield to pass elements to a block

Example (my_find)

Goes through each element

Returns the first element for which the block is true

Returns nil if nothing matches

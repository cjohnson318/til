local pretty = require 'pl.pretty'
-- create a table
tbl = {}
table.insert(tbl, 'alpha')
-- pretty print table
pretty.dump(tbl)
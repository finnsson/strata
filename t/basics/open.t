#!/usr/bin/env _coffee
fs = require "fs"
require("./proof") 2, ({ Strata, directory }, _) ->
  strata = new Strata directory: directory, leafSize: 3, branchSize: 3
  strata.create(_)
  strata.close(_)
  strata = new Strata directory: directory, leafSize: 3, branchSize: 3
  strata.open(_)
  @equal strata._io.size, 0, "json size"
  @equal strata._io.nextAddress, 2, "next address"

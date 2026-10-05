return {
   settings = {
      basedpyright = {
         analysis = {
            diagnosticMode = "openFilesOnly",
            diagnosticSeverityOverrides = {
               reportAny = false,
               reportExplicitAny = false,
               reportUnusedCallResult = false,
            },
         },
         inlayHints = {
            callArgumentNames = true
         }
      }
   }
}


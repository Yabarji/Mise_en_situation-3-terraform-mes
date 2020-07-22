#!/bin/sh
    fmt_diff=$(find . -name "*.tf" | xargs -I{} /ttelier-1 fmt -write=false {} | sed '/^\s*$/d')
    if test -n "$fmt_diff"; then
      echo "******* Terraform formatting error:"
      echo ""
      echo $fmt_diff
      exit 1
    fi

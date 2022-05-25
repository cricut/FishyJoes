#!/bin/zsh

set -euo pipefail

# format documented at http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
sed -En -f <(cat <<'EOF'
# outer wrapper start
1 i\
<coverage version="1">

# start of each file record in the format "SF:/path/to/file"
/^SF:/ {
    s/^SF:(.*)/  <file path="\1">/
    p
}

# line of coverage in the format "DA:42,37"
/^DA:/ {
    # escape XML
    s/&/\&amp;/g
    s/</\&lt;/g
    s/>/\&gt;/g
    s/"/\&quot;/g

    s#^DA:([[:digit:]]+),0$#    <lineToCover lineNumber="\1" covered="false" />#
    s#^DA:([[:digit:]]+),[[:digit:]]+$#    <lineToCover lineNumber="\1" covered="true" />#
    p
}

# end of each file record
/^end_of_record$/ i\
  </file>

# outer wrapper end
$ i\
</coverage>
EOF
)

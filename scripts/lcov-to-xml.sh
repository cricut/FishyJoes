#!/bin/zsh

set -euo pipefail

# format documented at http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
# e.g.

# SF:/Users/acobb/src/FishyJoes/Sources/FishyJoesJavaRuntime/Box+java-type.swift
# FN:6,$s22FishyJoesCommonRuntime3BoxV0ab4JavaD0E04fromF0_3envACyxGs13OpaquePointerVSg_AD3EnvVtKFZ
# <snip>
# DA:6,3040
# DA:7,3040
# DA:8,3040
# DA:15,3040
# DA:16,3040
# DA:17,3040
# DA:18,3040
# DA:20,0
# DA:21,0
# <snip>
# end_of_record
# SF:/Users/acobb/src/FishyJoes/Sources/FishyJoesJavaRuntime/Default.swift
# <snip>
# DA:12,2
# <snip>
# end_of_record

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

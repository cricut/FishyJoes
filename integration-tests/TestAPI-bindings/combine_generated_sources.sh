#!/bin/bash
#

if [[ $# -eq 0 ]] ; then
    echo 'usage: ./combine_generated_sources.sh ModuleName'
    echo 'ModuleName is name of your module we are generating bindings for such as TestAPI or CriGeo or Tesseract'
    exit 0
fi

(
    cd Sources/Generated/NodeInterface
    cat $1.*.swift | grep import | sort | uniq > $1+node.swift
    cat $1.*.swift | grep -v import >> $1+node.swift
    rm $1.*.swift
)

(
    cd Sources/Generated/JavaInterface
    cat $1.*.swift | grep import | sort | uniq > $1+java.swift
    cat $1.*.swift | grep -v import >> $1+java.swift
    rm $1.*.swift
)

(
    cd Sources/Generated/IotaInterface
    cat $1.*.swift | grep import | sort | uniq > $1+iota.swift
    cat $1.*.swift | grep -v import >> $1+iota.swift
    rm $1.*.swift
)

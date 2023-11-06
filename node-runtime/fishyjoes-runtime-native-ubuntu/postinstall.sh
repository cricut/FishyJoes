#!/bin/bash
#

# Link versioned SO files to their expected link locations since NPM does not include them
# See https://github.com/npm/cli/issues/6744
for SO in *.so.*; do LINK=${SO%.*}; if [ ! -L "$LINK" ]; then ln -sf $SO $LINK; fi; done
for SO in *.so.*; do LINK=${SO%.*}; if [ ! -L "$LINK" ]; then ln -sf $SO $LINK; fi; done


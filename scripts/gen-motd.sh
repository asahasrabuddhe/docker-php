#!/bin/bash
NEWLINE=$'\n'

# Read in from issue file and parse
value=$(</etc/issue)
value=${value//\\b/''}
value=${value//\\d/''}
value=${value//\\s/''}
value=${value//\\l/''}
value=${value//\\m/''}
value=${value//\\n/''}
value=${value//\\o/''}
value=${value//\\r/''}
value=${value//\\t/''}
value=${value//\\u/''}
value=${value//\\U/''}
value=${value//\\v/''}

value="Image Based on ${value}${NEWLINE}${NEWLINE}Built By: Ajitem Sahasrabuddhe <me@ajitem.com> <github.com/asahasrabuddhe>"

echo "$value"
#!/bin/bash
cat $1 | java -jar ~/tools/plantuml.jar -tutxt -p | cat

#!/bin/bash
# Извлекаем версию Flutter из файла .fvmrc с помощью jq
FLUTTER_VERSION=$(jq -r '.flutter' .fvmrc)
echo $FLUTTER_VERSION
#!/bin/sh

# Check if all required arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <obfuscateDir> <decompiledDir> <decompiledAPKName>"
    exit 1
fi

echo "in"
# Assign command-line arguments to variables
obfuscateDir="$1"
decompiledDir="$2"
decompiledAPKName="$3"

# Run the command
cd /obfs/src && python3 -m obfuscapk.cli -o ClassRename -o ConstStringEncryption -o DebugRemoval -o FieldRename -o MethodRename -o Rebuild -w /tmp -d "$obfuscateDir/$decompiledAPKName"_obfs.apk -i "$decompiledDir/$decompiledAPKName/dist/$decompiledAPKName.apk"


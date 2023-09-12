# Use C# classes and enums as they provide a better dev and module consumer experience:
# 	https://blog.danskingdom.com/How-and-where-to-properly-define-classes-and-enums-in-your-PowerShell-modules/
# Store the actual code in a .cs file to get syntax checking and IntelliSense, and just read it in and load it here.
# Only add the types if they don't already exist. This is quicker than re-adding the types and it failing.
if (-not ('tiPS.Configuration' -as [type]))
{
	[string] $classDefinition = [System.IO.File]::ReadAllText("$PSScriptRoot\Configuration.cs")
	Add-Type -Language CSharp -TypeDefinition $classDefinition
}

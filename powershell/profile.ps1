$poshGitModule = Get-Module posh-git -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
if ($poshGitModule -and ($poshGitModule.Version.Major -ge 1)) {
	$poshGitModule | Import-Module
	$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'LightBlue'
	$GitPromptSettings.WindowTitle = $null
} else {
	Write-Warning 'posh-git 1.0 not found; install with:'
	Write-Warning 'Install-Module -Name posh-git -AllowPrerelease'
}
Remove-Variable -Name poshGitModule

New-Alias -Name g -Value git

# this used to bind to F8
Set-PSReadLineKeyHandler -Key PageUp -Function HistorySearchBackward
# this used to bind to Shift-F8
Set-PSReadLineKeyHandler -Key PageDown -Function HistorySearchForward

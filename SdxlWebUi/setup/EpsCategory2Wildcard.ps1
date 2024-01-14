$srcPath = [System.IO.Path]::GetFullPath($Args[0]);
$lines = [System.IO.File]::ReadAllLines($srcPath);

$wildcards = @{}
$categoryName = $null;
$categoryPattern = "^[^ ].*:$";
$itemPattern = "^\s{2}.*:.*$"
$stringPattern = '^"(.*)"$';

foreach ($line in $lines) {
	if ($line -match $categoryPattern) {
		$categoryName = $line.Substring(0, $line.Length - 1);
		$wildcards[$categoryName] = @();
	}
	elseif ($line -match $itemPattern) {
		if ($null -eq $categoryName) { continue; }
		$prompt = ($line -split ":", 2)[1].Trim();
		if ($prompt -match $stringPattern) { $prompt = $prompt.Substring(1, $prompt.Length - 2); }
		$wildcards[$categoryName] += $prompt
	}
}

$dstDir = [System.IO.Path]::GetDirectoryName($srcPath);
foreach ($key in $wildcards.Keys) {
	$dstPath = [System.IO.Path]::ChangeExtension([System.IO.Path]::Combine($dstDir, $key), "txt");
	[System.IO.File]::WriteAllLines($dstPath, $wildcards[$key]);
}

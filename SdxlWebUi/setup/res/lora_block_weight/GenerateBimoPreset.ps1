$outPath = "$PSScriptRoot\bimo.txt";

$baseList = @( @("B", 1), @("b", 0) );
$inList = @( @("I", 1), @("i", 0) );
$midList = @( @("M", 1), @("m", 0) );
$outList = @( @("O", 1), @("o", 0) );

$dynamicPrompt = "";
$xyzPlot = "";
$table = "";
$subTable = "";

foreach ($base in $baseList) {
	$baseChar = $base[0];
	$baseValue = $base[1];
	foreach ($in in $inList) {
		$inChar = $in[0];
		$inValue = $in[1];
		$inValueList = ""
		for ($i0 = 0; $i0 -lt 9; $i0++) { $inValueList += ",$inValue"; }
		foreach ($mid in $midList) {
			$midChar = $mid[0];
			$midValue = $mid[1];
			foreach ($out in $outList) {
				$outChar = $out[0];
				$outValue = $out[1];
				$outValueList = ""
				for ($o0 = 0; $o0 -lt 9; $o0++) { $outValueList += ",$outValue"; }
				$code = "$baseChar$inChar$midChar$outChar";
				$dynamicPrompt += "$code|";
				$xyzPlot += "$code,";
				$table += "$code`:$baseValue$inValueList,$midValue$outValueList`r`n";

				$subDynamicPrompt = "";
				$subXyzPlot = "BIMO,";
				$inSubList = @($inChar, "Ii", "iI");
				$outSubList = @($outChar, "Oo", "oO");
				foreach ($inSub in $inSubList) {
					foreach ($outSub in $outSubList) {
						$subCode = "$baseChar$inSub$midChar$outSub"
						$subDynamicPrompt += "$subCode|";
						$subXyzPlot += "$subCode,";
					}
				}
				$subDynamicPrompt = $subDynamicPrompt.Substring(0, $subDynamicPrompt.Length - 1);
				#$subTable += "$subDynamicPrompt`r`n";
				$subTable += "$($subXyzPlot)bimo`r`n";
			}
		}
		
	}
}
$dynamicPrompt = $dynamicPrompt.Substring(0, $dynamicPrompt.Length - 1);
$xyzPlot = $xyzPlot.Substring(0, $xyzPlot.Length - 1);

Write-Host "# BIMO > BIIMOO Table"
Write-Host "$subTable";

Write-Host "# BIMO Table";
#Write-Host "$dynamicPrompt";
Write-Host "$xyzPlot";
Write-Host "$table"

Write-Output "# BIMO Table`r`n$table" | Out-File $outPath -Encoding UTF8;

$dynamicPrompt = "";
$xyzPlot = "";
$table = "";

foreach ($base in $baseList) {
	$baseChar = $base[0];
	$baseValue = $base[1];
	foreach ($in0 in $inList) {
		$in0Char = $in0[0];
		$in0Value = $in0[1];
		$in0ValueList = ""
		for ($i0 = 0; $i0 -lt 8; $i0++) { $in0ValueList += ",$in0Value"; }
		foreach ($in1 in $inList) {
			$in1Char = $in1[0];
			$in1Value = $in1[1];
			$in1ValueList = ""
			for ($i1 = 0; $i1 -lt 1; $i1++) { $in1ValueList += ",$in1Value"; }
			foreach ($mid in $midList) {
				$midChar = $mid[0];
				$midValue = $mid[1];
				foreach ($out0 in $outList) {
					$out0Char = $out0[0];
					$out0Value = $out0[1];
					$out0ValueList = ""
					for ($o0 = 0; $o0 -lt 2; $o0++) { $out0ValueList += ",$out0Value"; }
					foreach ($out1 in $outList) {
						$out1Char = $out1[0];
						$out1Value = $out1[1];
						$out1ValueList = ""
						for ($o1 = 0; $o1 -lt 7; $o1++) { $out1ValueList += ",$out1Value"; }
						$code = "$baseChar$in0Char$in1Char$midChar$out0Char$out1Char";
						$dynamicPrompt += "$code|";
						$xyzPlot += "$code,";
						$table += "$code`:$baseValue$in0ValueList$in1ValueList,$midValue$out0ValueList$out1ValueList`r`n";
					}
				}
			}
		}
	}
}

$dynamicPrompt = $dynamicPrompt.Substring(0, $dynamicPrompt.Length - 1);
$xyzPlot = $xyzPlot.Substring(0, $xyzPlot.Length - 1);
Write-Host "# BIIMOO Table";
#Write-Host "$dynamicPrompt";
Write-Host "$xyzPlot";
Write-Host "$table"

Write-Output "# BIIMOO Table`r`n$table" | Out-File $outPath -Encoding UTF8 -Append;

$dynamicPrompt = "";
$xyzPlot = "";
$table = "";

foreach ($base in $baseList) {
	$baseChar = $base[0];
	$baseValue = $base[1];
	foreach ($in0 in $inList) {
		$in0Char = $in0[0];
		$in0Value = $in0[1];
		$in0ValueList = ""
		for ($i0 = 0; $i0 -lt 7; $i0++) { $in0ValueList += ",$in0Value"; }
		foreach ($in1 in $inList) {
			$in1Char = $in1[0];
			$in1Value = $in1[1];
			$in1ValueList = ""
			for ($i1 = 0; $i1 -lt 1; $i1++) { $in1ValueList += ",$in1Value"; }
			foreach ($in2 in $inList) {
				$in2Char = $in2[0];
				$in2Value = $in2[1];
				$in2ValueList = ""
				for ($i2 = 0; $i2 -lt 1; $i2++) { $in2ValueList += ",$in2Value"; }
				foreach ($mid in $midList) {
					$midChar = $mid[0];
					$midValue = $mid[1];
					foreach ($out0 in $outList) {
						$out0Char = $out0[0];
						$out0Value = $out0[1];
						$out0ValueList = ""
						for ($o0 = 0; $o0 -lt 1; $o0++) { $out0ValueList += ",$out0Value"; }
						foreach ($out1 in $outList) {
							$out1Char = $out1[0];
							$out1Value = $out1[1];
							$out1ValueList = ""
							for ($o1 = 0; $o1 -lt 1; $o1++) { $out1ValueList += ",$out1Value"; }
							foreach ($out2 in $outList) {
								$out2Char = $out2[0];
								$out2Value = $out2[1];
								$out2ValueList = ""
								for ($o2 = 0; $o2 -lt 7; $o2++) { $out2ValueList += ",$out2Value"; }
	
								$code = "$baseChar$in0Char$in1Char$in2Char$midChar$out0Char$out1Char$out2Char";
								$dynamicPrompt += "$code|";
								$xyzPlot += "$code,";
								$table += "$code`:$baseValue$in0ValueList$in1ValueList$in2ValueList,$midValue$out0ValueList$out1ValueList$out2ValueList`r`n";
							}
						}
					}
				}
			}
		}
	}
}

$dynamicPrompt = $dynamicPrompt.Substring(0, $dynamicPrompt.Length - 1);
$xyzPlot = $xyzPlot.Substring(0, $xyzPlot.Length - 1);
Write-Host "# BIIIMOOO Table";
#Write-Host "$dynamicPrompt";
#Write-Host "$xyzPlot";
Write-Host "$table"

Write-Output "# BIIIMOOO Table`r`n$table" | Out-File $outPath -Encoding UTF8 -Append;

$dynamicPrompt = "";
$xyzPlot = "";
$table = "";

foreach ($base in $baseList) {
	$baseChar = $base[0];
	$baseValue = $base[1];
	foreach ($in0 in $inList) {
		$in0Char = $in0[0];
		$in0Value = $in0[1];
		$in0ValueList = ""
		for ($i0 = 0; $i0 -lt 5; $i0++) { $in0ValueList += ",$in0Value"; }
		foreach ($in1 in $inList) {
			$in1Char = $in1[0];
			$in1Value = $in1[1];
			$in1ValueList = ""
			for ($i1 = 0; $i1 -lt 2; $i1++) { $in1ValueList += ",$in1Value"; }
			foreach ($in2 in $inList) {
				$in2Char = $in2[0];
				$in2Value = $in2[1];
				$in2ValueList = ""
				for ($i2 = 0; $i2 -lt 1; $i2++) { $in2ValueList += ",$in2Value"; }
				foreach ($in3 in $inList) {
					$in3Char = $in3[0];
					$in3Value = $in3[1];
					$in3ValueList = ""
					for ($i3 = 0; $i3 -lt 1; $i3++) { $in3ValueList += ",$in3Value"; }
					foreach ($mid in $midList) {
						$midChar = $mid[0];
						$midValue = $mid[1];
						foreach ($out0 in $outList) {
							$out0Char = $out0[0];
							$out0Value = $out0[1];
							$out0ValueList = ""
							for ($o0 = 0; $o0 -lt 1; $o0++) { $out0ValueList += ",$out0Value"; }
							foreach ($out1 in $outList) {
								$out1Char = $out1[0];
								$out1Value = $out1[1];
								$out1ValueList = ""
								for ($o1 = 0; $o1 -lt 1; $o1++) { $out1ValueList += ",$out1Value"; }
								foreach ($out2 in $outList) {
									$out2Char = $out2[0];
									$out2Value = $out2[1];
									$out2ValueList = ""
									for ($o2 = 0; $o2 -lt 1; $o2++) { $out2ValueList += ",$out2Value"; }
									foreach ($out3 in $outList) {
										$out3Char = $out3[0];
										$out3Value = $out3[1];
										$out3ValueList = ""
										for ($o3 = 0; $o3 -lt 6; $o3++) { $out3ValueList += ",$out3Value"; }
	
										$code = "$baseChar$in0Char$in1Char$in2Char$in3Char$midChar$out0Char$out1Char$out2Char$out3Char";
										$dynamicPrompt += "$code|";
										$xyzPlot += "$code,";
										$table += "$code`:$baseValue$in0ValueList$in1ValueList$in2ValueList$in3ValueList,$midValue$out0ValueList$out1ValueList$out2ValueList$out3ValueList`r`n";
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

$dynamicPrompt = $dynamicPrompt.Substring(0, $dynamicPrompt.Length - 1);
$xyzPlot = $xyzPlot.Substring(0, $xyzPlot.Length - 1);
Write-Host "# BIIIIMOOOO Table";
#Write-Host "$dynamicPrompt";
#Write-Host "$xyzPlot";
#Write-Host "$table"

Write-Output "# BIIIIMOOOO Table`r`n$table" | Out-File $outPath -Encoding UTF8 -Append;

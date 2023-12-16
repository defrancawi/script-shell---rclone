# diret�rio que cont�m os arquivos a serem retidos
$diretorio = "X:\BKP - NUVEM"

# lista de todos os arquivos no diret�rio
$arquivos = Get-ChildItem $diretorio | Where-Object {-not $_.PsIsContainer}

# ordena os arquivos por data de modifica��o (do mais recente ao mais antigo)
$arquivos_ordenados = $arquivos | Sort-Object LastWriteTime -Descending

# mant�m apenas os 5 arquivos mais recentes
$arquivos_a_manter = $arquivos_ordenados[0..4]

# exclui todos os outros arquivos
foreach ($arquivo in $arquivos) {
  if ($arquivos_a_manter -notcontains $arquivo) {
    Remove-Item $arquivo.FullName
  }
}






